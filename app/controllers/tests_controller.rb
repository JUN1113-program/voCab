class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wordbook
  before_action :his_wordbook?, only: :destroy
  before_action :already_exists?, only: [:new, :create]
  before_action :secret_wordbook?, only: [:show]

  def new
    @test = Test.new
  end

  def create
    test = Test.create(test_params)
    wordbook = test.wordbook
    testword_params.each.with_index do |words, i|
      question = Question.create(test_id: test.id, word_id: wordbook.words[i].id)
      words.each.with_index do |word, j|
        correct = j == 0 ? 1 : 0
        Testword.create(word: word, correct: correct, question_id: question.id)
      end
    end

    unless test_created?(test)
      test.destroy
      redirect_to new_wordbook_test_path(wordbook.id)
    else
      redirect_to wordbook_words_path(wordbook.id)
    end
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
    params.permit(:wordbook_id)
  end

  def already_exists?
    redirect_to root_path if @wordbook.test
  end

  # 正常にtestが作られているかどうか確認する
  def test_created?(test)
    return nil unless test.questions&.length == @wordbook.words.length
    test.questions.each do |question|
      return nil unless question.testwords.length == 4
    end
  end
end
