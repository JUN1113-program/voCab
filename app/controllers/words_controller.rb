class WordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_wordbook
  before_action :set_word, only: [:edit,:update,:destroy]
  before_action :set_words, only: [:new, :edit]
  before_action :his_wordbook?, except: :index

  def index
  end

  def new
    @word = @wordbook.words.new
  end

  def create
    Word.create(word_params)
    redirect_to new_wordbook_word_path(params[:wordbook_id])
  end

  def edit
    render "words/new"
  end

  def update
    @word.update(word_params)
    redirect_to new_wordbook_word_path(params[:wordbook_id])
  end

  def destroy
    @word.destroy
    redirect_to new_wordbook_word_path(params[:wordbook_id])
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

  def set_words
    @words = @wordbook.words.order("updated_at DESC")
  end
end