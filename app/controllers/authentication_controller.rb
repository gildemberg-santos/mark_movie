class AuthenticationController < ApplicationController
  # https://www.pluralsight.com/guides/token-based-authentication-with-ruby-on-rails-5-api
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:username], params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
