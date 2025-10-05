class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update ]

  # GET /users
  def index
    @users = User.all

    render json: @users.as_json(except: [:password_digest])
  end

  # GET /users/1
  def show
    render json: @user.as_json(except: [:password_digest])
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user.as_json(except: [:password_digest])
    else
      render json: @user.errors, status: :unprocessable_content
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.expect(user: [ :first_name, :last_name, :email, :phone_number ])
    end
end
