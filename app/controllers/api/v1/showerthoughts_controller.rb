# frozen_string_literal: true
module Api
  module V1
    # the showerthought class represents a post.
    # here are the functions linked to the endpoints gravitating around "/showerthoughts/"
    class ShowerthoughtsController < ApplicationController
      before_action :set_showerthought, only: %i[show destroy]

      # GET /showerthoughts#index
      def index
        @showerthoughts = Showerthought.all

        render json: @showerthoughts
      end

      # GET /showerthoughts/most_commented/1
      def most_commented
        showers = Showerthought.joins(:comments)
                               .select('COUNT(comments.id) as cbComment', :id, :context, :content)
                               .group(:id, :context, :content)
                               .order('COUNT(comments.id) DESC')
                               .limit(params[:amount])
        @showerthoughts = showers
        render json: @showerthoughts
      end

      # GET /showerthoughts/most_popular/1
      def most_popular
        showers = Showerthought.joins(:thumbs)
                               .select('COUNT(thumbs.id) as nbLikes', :id, :context, :content)
                               .group(:id, :direction, :context, :content)
                               .having('thumbs.direction is true')
                               .order('COUNT(thumbs.id) DESC')
                               .limit(params[:amount])

        @showerthoughts = showers

        render json: @showerthoughts
      end

      # GET /showerthoughts/count
      def count
        render json: Showerthought.count
      end

      # GET /showerthoughts/by_comment/1
      def by_comment
        comment = Comment.find(params['comment_id'])
        @showerthought = Showerthought.find(comment.showerthought_id)

        render json: @showerthought
      end

      # GET /showerthoughts/by_user/1
      def by_user
        @showerthought = Showerthought.where(user_id: params['user_id'])

        render json: @showerthought
      end

      # GET /showerthoughts/by_tag/1
      def by_tag
        taggeds = Tagged.joins(:showerthought).where(tag_id: params['tag_id'])
        @showerthought = taggeds

        render json: @showerthought
      end

      # GET /showerthoughts/1
      def show
        render json: @showerthought
      end

      # POST /showerthoughts
      def create
        @showerthought = Showerthought.new(showerthought_create_params)
        if @showerthought.save
          render json: @showerthought, status: :created
        else
          render json: @showerthought.errors, status: :unprocessable_entity
        end

      end

      # if not already existing, sets a like/dislike to the specified user.
      # POST /showerthoughts/l
      def add_thumb
        thumb = Thumb.new(thumb_params)
        if Thumb.exists?(showerthought_id: thumb_params[:showerthought_id],
                         user_id: thumb_params[:user_id])
          render json: thumb.errors, status: :conflict
        elsif thumb.save
          render json: thumb, status: :created, location: @showerthought
        else
          render json: thumb.errors, status: :unprocessable_entity
        end
      end

      # PUT /showerthoughts/tag
      def set_tag
        tag = Tag.find_by_name(showerthought_tag_params[:name])
        if  tag.blank?
          tag = Tag.new(uses: 0, name: showerthought_tag_params[:name])
        else
          tag.uses += 1
        end


        @showerthought = Showerthought.find(showerthought_id_param[:id])
        if @showerthought.blank?
        render json: @showerthought.errors, status: :not_found
        return
        end

        tagged = Tagged.where(showerthought_id: showerthought_id_param[:id], tag_id: tag.id)
        if tagged.blank?
          tagged = Tagged.new(tag_id: tag.id, showerthought_id: showerthought_id_param[:id])
          if tagged.save
            if tag.save
            render json: tag, status: :created
            else
              render json: tag.errors, status: :unprocessable_entity
            end
          else
            render json: tagged.errors, status: :unprocessable_entity
          end
        else
          render json: tagged, status: :conflict
        end
      end

      # DELETE /showerthoughts/1
      def destroy
        taggeds = Tagged.where(showerthought_id: @showerthought.id)
        tags = Tag.joins(taggeds)
        tags.each do |tag|
          if tag.uses == 1
            tag.destroy
          else
            tag.uses -= 1
            tag.save
          end
        end
        Comment.where(showerthought_id: @showerthought.id).destroy_all
        @showerthought.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_showerthought
        @showerthought = Showerthought.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def showerthought_create_params
        params.require(:showerthought).permit(:content, :context, :user_id)
      end

      def showerthought_tag_params
        params.require(:tag).permit(:name)
      end


      def showerthought_id_param
        params.require(:showerthought).permit(:id)
      end


      #todo :
      # set tag after created
      # remove tag
      # set comment []
      # delete showerthought and associated tags that have no other associations
    end
  end
end
