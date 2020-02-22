module Api
  module  V1
    class ThumbsController < ApplicationController
      before_action :set_thumb, only: [:show, :update, :destroy]

      # GET /thumbs
      def index
        @thumbs = Thumb.all

        render json: @thumbs
      end

      # GET /thumbs/1
      def show
        render json: @thumb
      end

      # POST /thumbs
      def create
        @thumb = Thumb.new(thumb_params)

        if @thumb.save
          render json: @thumb, status: :created, location: @thumb
        else
          render json: @thumb.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /thumbs/1
      def update
        if @thumb.update(thumb_params)
          render json: @thumb
        else
          render json: @thumb.errors, status: :unprocessable_entity
        end
      end

      # DELETE /thumbs/1
      def destroy
        @thumb.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_thumb
        @thumb = Thumb.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def thumb_params
        params.require(:thumb).permit(:direction, :user_id, :showerthought_id)
      end
    end
  end
end
