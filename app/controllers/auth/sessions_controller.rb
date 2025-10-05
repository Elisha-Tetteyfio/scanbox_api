class Auth::SessionsController < ApplicationController
  skip_before_action :authenticate_user
  # POST /auth/login
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)

      cookies.encrypted[:accessToken] = {
        value: token,
        httponly: true,
        secure: Rails.env.production?,
        same_site: :lax,
        expires: 24.hours.from_now
      }
     render json: { message: "Logged in successfully" }, status: :ok
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  # POST /auth/logout
  def delete
    cookies.delete(:accessToken)
    render json: { message: "Logged out" }
  end

  private

    def login_params
      params.expect(session: [:email, :password ])
    end
end
