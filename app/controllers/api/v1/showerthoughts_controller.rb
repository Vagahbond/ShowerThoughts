module Api
  module V1
    class ShowerthoughtsController < ApplicationController
      before_action :set_showerthought, only: [:show, :update, :destroy]

      # GET /showerthoughts
      def index
        @showerthoughts = Showerthought.order('created_at DESC')

        render json: @showerthoughts
      end

      # GET /showerthoughts/1
      def show
        render json: @showerthought
      end

      # POST /showerthoughts
      def create
        @showerthought = Showerthought.new(showerthought_params)

        if @showerthought.save
          render json: @showerthought, status: :created, location: @showerthought
        else
          render json: @showerthought.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /showerthoughts/1
      def update
        if @showerthought.update(showerthought_params)
          render json: @showerthought
        else
          render json: @showerthought.errors, status: :unprocessable_entity
        end
      end

      # DELETE /showerthoughts/1
      def destroy
        @showerthought.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_showerthought
        @showerthought = Showerthought.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def showerthought_params
        params.require(:showerthought).permit(:content, :context, :user_id)
      end
    end
  end
end
