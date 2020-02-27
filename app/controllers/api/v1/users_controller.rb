module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :update, :destroy]

      # GET /users
      def index
        @users = User.all

        render json: @users
      end

      # GET /users/1
      def show
        render json: @user
      end

      # POST /users
      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created, location: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1/destroy
      def destroy

        @user.delete()
      end

      # GET comments/:id/user
      def user_comment
        if Comment.exists?(id: params[:id])
          com = Comment.find_by_id(params[:id])
          @user = User.find_by_id(com.user_id)
          render json: @user
        else
            redirect_to "/api/v1/comments"
        end
      end

      # GET comments/:id/user
      def user_showerthoughts
        if Showerthought.exists?(id: params[:id])
          sho = Showerthought.find_by_id(params[:id])
          @user = User.find_by_id(sho.user_id)
          render json: @user
        else
          redirect_to "/api/v1/showerthoughts"
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        if User.exists?(id: params[:id])
          @user = User.find(params[:id])
        else
          redirect_to "/api/v1/users"
        end
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:username, :password, :profile_pic, :email)
      end
    end

  end
end
