class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kitten.all
  end

  def show
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "Kitten successfully created."
      redirect_to @kitten
    else
      flash.now[:warning] = "Something went wrong. Please try again."
      render :new
    end
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      flash[:success] = "Kitten successfully updated."
      redirect_to @kitten
    else
      render :edit
    end
  end

  def destroy
    @kitten.destroy
    flash[:success] = "Kitten destroyed :-("
    redirect_to root_url
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
