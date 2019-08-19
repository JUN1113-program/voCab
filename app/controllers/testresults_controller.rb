class TestresultsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root, only: :create
  private
  def testresult_params
    params.permit(:test_id).merge(user_id: current_user.id,score: 0)
  end

  def move_to_root
    redirect_to root_path unless params[:testresult]
  end
end
