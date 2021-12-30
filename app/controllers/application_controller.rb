class ApplicationController < ActionController::API
  # Token API
  # https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api
  before_action :authenticate_request
  attr_reader :current_user

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
