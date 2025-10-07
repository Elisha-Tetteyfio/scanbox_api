class Auth::RegistrationsController < ApplicationController
  skip_before_action :authenticate_user

  # POST /auth/signup
  def create
    @user = User.new(signup_params)

    if @user.save
      render json: @user.as_json(except: [:password_digest]), status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_content
    end
  end

  private

    def signup_params
      params.expect(registration: [ :first_name, :last_name, :email, :password, :phone_number, :user_type ])
    end
end
