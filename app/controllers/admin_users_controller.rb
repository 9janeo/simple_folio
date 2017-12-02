class AdminUsersController < ApplicationController
  
  layout 'admin'
  
  before_action :confirm_logged_in
  before_action :require_admin, :except => [:index, :new, :create]
  before_action :fetch_all_admins, :only => [:index]
  
  
  def index
    fetch_all_admins
  end

  def new
    @admin = AdminUser.new
  end

  def create
    @admin = AdminUser.new(admin_user_params)
    if @admin.save
      flash[:notice] = "Admin user successfully saved"
      redirect_to(admin_users_path)
    else
      flash.now[:notice] = "Something went worng, admin user was not saved"
      render 'new'
    end
  end

  def edit
    require_admin
  end

  def update
    require_admin
    if @admin.update_attributes(admin_user_params)
      flash[:notice] = "Admin user upadted successfully."
      redirect_to(admin_users_path)
    else
      flash[:notice] = "Something went wrong, admin user did not update."
      render 'edit'
    end
  end

  def delete
    require_admin
  end

  def destroy
    require_admin
    @admin.destroy
    flash[:notice] = "Admin user deleted successfully."
    redirect_to(admin_users_path)
  end
  
  private
  
  def admin_user_params
    params.require(:admin_user).permit(
      :first_name,
      :last_name,
      :email,
      :username,
      :password)
  end
  
  def fetch_all_admins
    @admin_list = AdminUser.sorted
  end
  
  def require_admin
    @admin = AdminUser.find(params[:id])
  end
  
end
