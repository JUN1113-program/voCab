class WordbookController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @wordbooks = Wordbook.all
  end
  end
end
