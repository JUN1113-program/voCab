class WordsController < ApplicationController
  before_action :authenticate_user!
end