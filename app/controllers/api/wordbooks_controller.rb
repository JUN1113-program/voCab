class Api::WordbooksController < ApplicationController
  before_action :set_favorite
  def update
    @fav = Favorite.create(user_id: current_user.id,wordbook_id: params[:id])
  end
  def destroy
    @fav.destroy
  end

  private
  def set_favorite
    @fav = Favorite.where(wordbook_id: params[:id]).find_by(user_id: current_user.id)
  end
end
