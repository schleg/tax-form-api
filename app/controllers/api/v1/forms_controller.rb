module Api
  module V1
    class FormsController < ApplicationController

      respond_to :json

      def index
        if params[:preparation_id]
          preparation = Preparation.find_by_id params[:preparation_id]
          if preparation.tax_forms.count == 0
            preparation.run_form_rules
          end
          render json: preparation.tax_forms
        end
      end
    end
  end
end
