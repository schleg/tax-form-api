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

      def show
        preparation = Preparation.find_by_id params[:id]
        render json: preparation
      end

      def update
        preparation = Preparation.find_by_id params[:id]
        if preparation.update_attributes preparation_parameters[:preparation]
          preparation.run_form_rules
        end
        render json: preparation
      end

      private

      def preparation_parameters
        params.permit(preparation: [ :age, :spouse_age, :interest_income, :taxable_income, :itemizing_deductions ])
      end
    end
  end
end
