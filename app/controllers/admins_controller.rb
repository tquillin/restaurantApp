class AdminsController < ApplicationController

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.save
      log_in @admin
      flash[:success] = "Welcome!"
        redirect_to @admin
    else
      render "new"
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def destroy
    # log_out if logged_in?
    # # log_out
    Admin.delete(params[:id])
    @admin = Admin.all
    render 'new'
  end

private
  def admin_params
    params.require(:admin).permit(:name, :username, :password)
  end

end
