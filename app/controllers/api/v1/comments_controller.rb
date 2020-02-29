module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_comment, only: %i[show destroy]

      # GET /comments
      def index
        @comments = Comment.all

        render json: @comments
      end

      # GET /comments/1
      def show
        render json: @comment
      end

      # GET /comment/by_showerthought/1
      def by_showerthought
        render json: Comment.find_by_showerthought_id(params[:showerthought_id])
      end

      # GET /comment/by_user/1
      def by_user
        render json: Comment.find_by_user_id(params[:user_id])
      end

      # POST /comments
      def create
        @comment = Comment.new(comment_params)

        if @comment.save
          render json: @comment, status: :created, location: @comment
        else
          render json: @comment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /comments/1
      def destroy
        @comment.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def comment_params
        params.require(:comment).permit(:content, :user_id, :showerthought_id)
      end
    end
  end
end
