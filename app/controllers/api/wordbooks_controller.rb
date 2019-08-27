class Api::WordbooksController < ApplicationController
  def update
    @fav = Favorite.create(user_id: current_user.id,wordbook_id: params[:id])
  end
  def destroy
    @fav = Favorite.where(wordbook_id: params[:id]).find_by(user_id: current_user.id)
    @fav.destroy
  end
end
