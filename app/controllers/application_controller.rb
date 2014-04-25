class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :authenticate

  def authenticate
    return true
    if params[:authToken]
      request_token = params[:authToken]
    else
      authenticate_or_request_with_http_token do |token, options|
        request_token = token
      end
    end
    auth_token = AuthenticationToken.find_by_token(request_token)
    if auth_token.present? && auth_token.expiry_at > DateTime.now
      @current_user = auth_token.user
    else
      head :unauthorized
    end
  end

  def current_user; @current_user; end
end
