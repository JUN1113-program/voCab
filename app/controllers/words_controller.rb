class WordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wordbook
  before_action :set_word, only: [:edit,:update,:destroy]
  before_action :his_wordbook?

  def new
    @word = @wordbook.words.new
  end

  def create
    @word = Word.new(word_params)

    if @word.save
      if params[:commit] == "restart"
        redirect_to new_wordbook_word_path(params[:wordbook_id])
      else
        redirect_to wordbook_path(params[:wordbook_id])
      end
    else
      redirect_to new_wordbook_word_path(params[:wordbook_id])
    end
  end

  def edit
  end

  def update
    @word.update(word_params)
    redirect_to wordbook_path(params[:wordbook_id])
  end

  def destroy
    @word.destroy
    redirect_to wordbook_path(params[:wordbook_id])
  end

  private
  def word_params
    params.require(:word).permit(:front,:reverse).merge(wordbook_id: params[:wordbook_id])
  end
  def set_wordbook
    @wordbook = Wordbook.find(params[:wordbook_id])
  end
  def set_word
    @word = @wordbook.words.find(params[:id])
  end
  def his_wordbook?
    redirect_to root_path unless current_user.id == @wordbook.user.id
  end
end