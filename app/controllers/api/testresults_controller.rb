class Api::TestresultsController < ApplicationController
  before_action :set_testresults

  def index
    
  private
  def set_testresults
    @testresults = current_user.testresults
  end
end
