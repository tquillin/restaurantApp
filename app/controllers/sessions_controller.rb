class SessionsController < ApplicationController

  def new
  end

  def create
    admin = Admin.find_by(username: params[:session][:username])
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      remember admin
      redirect_to admin
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    # log_out if logged_in?
    # # log_out
    # render 'new'
  end




end
