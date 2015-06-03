class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_url
    else
      flash.now[:danger] = 'Wrong user name or password'
      render 'new'
    end
  end
  def new
  end
  def destroy
  end
end
