class WordsController < ApplicationController
  before_action :authenticate_user!
  def new
    @word = @wordbook.words.new
  end
end