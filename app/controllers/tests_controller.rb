class TestsController < ApplicationController
  before_action :authenticate_user!
  def show
    @wordbook = Wordbook.find(params[:wordbook_id])
    @test = @wordbook.test
    @testresult = @test.testresults.new
  end
end
