class AdminsController < ApplicationController
  before_action :admin?
  private
  def admin?
    redirect_to root_path unless current_user&.admin
  end
end
