class DogsController < ApplicationController
  before_action :set_dog, only: [:show, :update, :destroy]

  def index
    @dogs = Dog.all
    render json: @dogs
  end

  def show
    render json: @dog
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      render json: @dog, status: :created
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  def update
    if @dog.update(dog_params)
      render json: @dog
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @dog.destroy
  end

  private

  def set_dog
    @dog = @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :img_url)
  end
end