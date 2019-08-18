class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def show
    @wordbooks = User.find(params[:id]).wordbooks
  end
end
