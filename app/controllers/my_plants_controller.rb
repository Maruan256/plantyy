class MyPlantsController < ApplicationController
  def show
    @my_plant = MyPlant.find(:id)
  end

  def create
    @my_plant = MyPlant.create(Plant.id)
  end
end
