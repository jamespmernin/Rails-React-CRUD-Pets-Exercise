class CatsController < ApplicationController

  before_action :set_cat, only: [:show, :update, :destroy]

  def index
    @cats = Cat.all
    render json: @cats
  end

  def show
    render json: @cat
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      render json: @cat, status: :created
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  def update
    if @cat.update(cat_params)
      render json: @cat
    else
      render json: @cat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cat.destroy
  end

  private

  def set_cat
    @cat = @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :breed, :img_url)
  end
end