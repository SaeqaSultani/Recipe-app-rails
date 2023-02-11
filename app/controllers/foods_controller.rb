class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user)
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id

    if @food.save
      redirect_to foods_path, notice: 'Food was successfully created.'
    else
      render :new, alert: 'Food was not created.'
    end
  end

  def new
    @food = Food.new
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food was successfully deleted.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
