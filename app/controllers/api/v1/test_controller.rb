module Api
  module V1
    class TestController < ApplicationController

      respond_to :json

      def index
        respond_with here: DateTime.now
      end
    end
  end
end
