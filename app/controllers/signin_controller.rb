class SigninController < ApplicationController
  def new
    @user = User.new
    
  end
    def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to their profile page
      sign_in user
      redirect_to user
    else
      # Display an error message and re-render the sign-in form
      flash.now[:error] = 'Invalid email/password combination'
      render 'signin/new'
    end
  end

  def destroy
  end
end
