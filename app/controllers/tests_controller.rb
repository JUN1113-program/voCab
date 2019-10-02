class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wordbook
  def new
    @test = Test.new
  end

  def create
    @test = Test.create(test_params)
    @wordbook = @test.wordbook
    testword_params.each.with_index do |words, i|
      @question = Question.create(test_id: @test.id, word_id: @wordbook.words[i].id)
      words.each.with_index do |word, j|
        correct = j == 0 ? 1 : 0
        Testword.create(word: word, correct: correct, question_id: @question.id)
      end
    end
    redirect_to wordbook_words_path(@wordbook.id)
  end

  def destroy
    @wordbook.test.destroy
    redirect_to wordbook_words_path(@wordbook.id)
  end

  def show
    @test = @wordbook.test
    @testresult = @test.testresults.new
  end

  private
  def set_wordbook
    @wordbook = Wordbook.find(params[:wordbook_id])
  end

  def testword_params
    wordsArray = []
    wordHash =  params.permit(words:{}).require(:words)
    wordHash.each do |key, value|
      wordsArray << value
    end
    return wordsArray
  end

  def test_params
    params.permit(:wordbook_id).merge(times: 0)
  end

end
