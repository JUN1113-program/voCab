class WordbooksController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @wordbooks = Wordbook.all
  end

  def new
    @wordbook = Wordbook.new
  end

  def show
    @wordbook = Wordbook.find(params[:id])
    viewed = @wordbook.viewed + 1
    @wordbook.update(viewed: viewed)
  end
end
