class TestresultsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root, only: :create
  before_action :user_eq?, only: [:show, :index]
  def index
    @testresults = Testresult.where(user_id: current_user.id).order("id DESC")
  end

  def create
    @testresult = Testresult.create(testresult_params)
    selections_params.each do |select|
      @testresult.selections.create(testword_id: select)
    end
    @testresult.update(score: calc_score(@testresult))
    redirect_to user_testresult_path(current_user.id,@testresult.id)
  end

  def show
    @testresult = Testresult.find(params[:id])
    @testresults = Testresult.where(user_id: current_user.id, test_id: @testresult.test.id).order("id DESC")
  end

  private
  def testresult_params
    params.permit(:test_id).merge(user_id: current_user.id,score: 0)
  end

  def selections_params
    params.require(:testresult).require(:testword_id).values
  end

  def calc_score(a_testresult)
    score_sum = 0
    a_testresult.selections.each do |select|
      score_sum += select.testword.correct
    end
    par = score_sum*100 / a_testresult.test.questions.length
  end

  def move_to_root
    redirect_to root_path unless params[:testresult]
  end

  def user_eq?
    redirect_to root_path unless current_user.id == params[:user_id].to_i
  end
end
