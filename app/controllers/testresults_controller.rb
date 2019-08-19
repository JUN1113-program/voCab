class TestresultsController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_root, only: :create
  def create
    @testresult = Testresult.create(testresult_params)
    @testresult.update(score: calc_score(@testresult))
  end

  def show
    @testresults = Testresult.where(user_id: current_user.id).order("id DESC")
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
end
