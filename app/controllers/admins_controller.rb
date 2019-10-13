class AdminsController < ApplicationController
  before_action :admin?

  def index
    @users = User.includes(:wordbooks)
  end
  private
  def admin?
    redirect_to root_path unless current_user&.admin
  end
end
