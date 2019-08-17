class WordbookController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @wordbooks = Wordbook.all
  end
  def show
    @wordbook = wordbook.find(params[:id])
  end
end
