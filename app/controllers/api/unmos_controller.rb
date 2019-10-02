class Api::UnmosController < ApplicationController
  def index
    @input = params[:input]
  end
end