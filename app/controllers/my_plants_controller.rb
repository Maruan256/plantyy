class MyPlantsController < ApplicationController
  def show
    @my_plant = MyPlant.find(params[:id])
  end

  def create
    @my_plant = MyPlant.create(Plant.id)
  end
end
