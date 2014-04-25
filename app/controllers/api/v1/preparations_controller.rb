module Api
  module V1
    class PreparationsController < ApplicationController

      respond_to :json

      def index
        render json: Preparation.all
      end

      def create
        preparation = Preparation.create params[:preparation]
        render json: preparation
      end
    end
  end
end
