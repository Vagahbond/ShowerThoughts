module Api
  module V1
    class TaggedsController < ApplicationController
      before_action :set_tagged, only: [:show, :update, :destroy]

      # GET /taggeds
      def index
        @taggeds = Tagged.all

        render json: @taggeds
      end

      # GET /taggeds/1
      def show
        render json: @tagged
      end

      # POST /taggeds
      def create
        @tagged = Tagged.new(tagged_params)

        if @tagged.save
          render json: @tagged, status: :created, location: @tagged
        else
          render json: @tagged.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /taggeds/1
      def update
        if @tagged.update(tagged_params)
          render json: @tagged
        else
          render json: @tagged.errors, status: :unprocessable_entity
        end
      end

      # DELETE /taggeds/1
      def destroy
        @tagged.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_tagged
        @tagged = Tagged.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def tagged_params
        params.require(:tagged).permit(:tag_id, :showerthought_id)
      end
    end
  end
end
