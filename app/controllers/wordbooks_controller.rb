class WordbooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_wordbook, only: [:edit, :update, :show, :destroy]
  before_action :his_wordbook?, only: [:edit, :update, :destroy]
  before_action :secret_wordbook?, only: [:show]

  def index
    @wordbooks = Wordbook.order("created_at DESC").page(params[:page]).per(12).includes(:user)
  end

  def new
    @wordbook = Wordbook.new
  end

  def create
    @wordbook = Wordbook.new(wordbook_params.merge(viewed: 0))
    if @wordbook.save
      redirect_to new_wordbook_word_path(@wordbook.id)
    else
      redirect_to new_wordbook_path
    end
  end

  def edit
  end

  def update
    if @wordbook.update(wordbook_params)
      redirect_to user_path(current_user.id)
    else
      redirect_to edit_wordbook_path(@wordbook.id)
    end
  end

  def destroy
    @wordbook.destroy
    redirect_to user_path(current_user.id)
  end

  def show
    viewed = @wordbook.viewed + 1
    @wordbook.update(viewed: viewed)
  end

  private
  def wordbook_params
    params.require(:wordbook).permit(:title, :reference, :share).merge(user_id: current_user.id)
  end

  def set_wordbook
    @wordbook = Wordbook.find(params[:id])
  end
end
