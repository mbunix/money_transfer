class Api::V1::UsersController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken
  def create
    @user = User.new(user_params)
  if @user.save
    render json: { message: 'User registered successfully' }, status: :created
  else
    render json: { error: 'User registration failed' }, status: :unprocessable_entity
  end
end
  def signin
    @user = User.find_by_email(params[:email])

    if @user && @user.valid_password?(params[:password])
      render json: {
        status: :success,
        data:   @user.as_json(only: [:id, :email, :name]),
        token:  @user.create_new_auth_token
      }
    else
      render json: { status: :error, message: 'Invalid email or password' }
    end
  end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :balance)
  end
end
