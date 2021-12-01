class MyPlantsController < ApplicationController
  def show
    @my_plant = MyPlant.find(:id)
  end

  def create
    @my_plant = MyPlant.create(Plant.id)
  end

  def planted
    @my_plant.water_level = Date.now
    @my_plant.fertilizer_level = Date.now
    @my_plant.bring_in = Date.now
  end

  def all_good

  end

  def check
    if Date.now - @my_plant.water_level >= @my_plant.plants.water
      all_good
    elsif Date.now - @my_plant.water_level < @my_plant.plants.water && Date.now - @my_plant.water_level > 1
      water_soon
    else
      water_now
    end
  end

end
