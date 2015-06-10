class SessionsController < ApplicationController
  skip_before_action :authenticate

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      redirect_to root_url
    else
      flash.now[:danger] = 'Wrong email or password'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
