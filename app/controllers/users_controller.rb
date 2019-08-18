class UsersController < ApplicationController
  def show 
  before_action :authenticate_user!, except: [:show]
  end
end
