class Api::WordsController < ApplicationController
  def index
    @wordbook = Wordbook.find(params[:wordbook_id])
  end
end