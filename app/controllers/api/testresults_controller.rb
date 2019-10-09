class Api::TestresultsController < ApplicationController
  before_action :set_testresults

  def index
  end
  def new
  end

  private
  def set_testresults
    @testresults = params[:test_id] ? current_user.testresults.where(test_id: params[:test_id]) : current_user.testresults
  end
end
