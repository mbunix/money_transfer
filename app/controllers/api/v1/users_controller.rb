class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
  if @user.save
    render json: { message: 'User registered successfully' }, status: :created
  else
    render json: { error: 'User registration failed' }, status: :unprocessable_entity
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :balance)
  end
end
