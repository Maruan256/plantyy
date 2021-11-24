class MyPlantsController < ApplicationController
  def show
    @my_plant = MyPlant.find(:id)
  end
end
