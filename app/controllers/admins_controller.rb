class AdminsController < ApplicationController
  def index
    @admins = Admin.all
  end

  def create
    @admin = Admin.create(admin_params)
      redirect_to admin_path(@admin)
  end

    def new
      # authenticate!
      @admin = Admin.new
    end

    # def log_in
    #     admin = Admin.find_by(username: params[:username])
    #     if admin && admin.authenticate(params[:password])
    #       session[:admin_id] = admin.id
    #       redirect_to admins_path
    #     else
    #       redirect_to admin_path(@admin)
    #     end
    #   end


    def show
      @admin = Admin.find(params[:id])
    end

   def edit
     @admin = Admin.find(params[:id])
   end


  def update
  admin = Admin.find(params[:id])
    admin.update(admin_params)
    redirect_to admin_path(admin)
  end

  def destroy
    admin = Admin.delete(params[:id])
      redirect_to admins_path
  end

  # def destroy
  #   admin = Admin.find(@current_admin)
  #     redirect_to admins_path
  #   end

private
  def admin_params
    params.require(:admin).permit(:name, :username, :password)
  end

end
