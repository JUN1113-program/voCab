class WordsController < ApplicationController
  before_action :authenticate_user!
  def new
    @word = @wordbook.words.new
  end

  def create
    @word = Word.create(word_params)
    if params[:commit] == "restart"
      redirect_to new_wordbook_word_path(params[:wordbook_id])
    else 
      redirect_to wordbook_path(params[:wordbook_id])
    end
  end

  def edit
  end
end