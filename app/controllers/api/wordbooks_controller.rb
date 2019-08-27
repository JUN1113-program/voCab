class Api::WordbooksController < ApplicationController
  def update
    @fav = Favorite.create(user_id: current_user.id,wordbook_id: params[:id])
  end
end
