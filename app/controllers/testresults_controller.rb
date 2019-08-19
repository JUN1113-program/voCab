class TestresultsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root, only: :create
  def move_to_root
    redirect_to root_path unless params[:testresult]
  end
end
