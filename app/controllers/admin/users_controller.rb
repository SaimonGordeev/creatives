class Admin::UsersController < ApplicationController

  before_filter :authenticate_user!

  before_action :check_admin

  def index
    @admin_users = User.all
  end

  def update
    temp = User.find(params[:id])
    temp.locking = !temp.locking
    temp.save
    redirect_to admin_users_path
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_users_path
  end

  private
    def check_admin
      redirect_to edit_user_registration_path unless current_user.admin?
    end
end
