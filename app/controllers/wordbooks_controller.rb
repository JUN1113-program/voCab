class WordbooksController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @wordbooks = Wordbook.all
  end

  def new
    @wordbook = Wordbook.new
  end

  def create
    @wordbook = Wordbook.create(wordbook_params.merge(viewed: 0))
    redirect_to new_wordbook_word_path(@wordbook.id)
  end

  def edit
  end

  def update
    @wordbook.update(wordbook_params)
    redirect_to root_path
  end
  def show
    @wordbook = Wordbook.find(params[:id])
    viewed = @wordbook.viewed + 1
    @wordbook.update(viewed: viewed)
  end
end
