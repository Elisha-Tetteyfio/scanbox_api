class ApplicationController < ActionController::API
  include ActionController::Cookies 
  include JsonWebToken

  before_action :authenticate_user

  private

  def authenticate_user
    token = cookies.encrypted[:accessToken]
    return render json: {error: "You must be signed in."}, status: :unauthorized unless token

    decoded = jwt_decode(token)
    @current_user ||= User.find_by(id: decoded[:user_id])
  rescue JWT::DecodeError
    render json: {error: "You must be signed in."}, status: :unauthorized
  end
end
