class SessionsController < ApplicationController
  def new
  end

  def create
    p = params[:session]
    user = User.find_by(email: p[:email].downcase)
    if user && user.authenticate(p[:password])
      log_in(user)
      redirect_to user
    else
      flash[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
