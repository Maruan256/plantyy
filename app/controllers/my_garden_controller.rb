class MyGardenController < ApplicationController
  def dashboard
    @my_garden = current_user.my_garden
    @my_plants = @my_garden.my_plants
    @garden_photo = GardenKit.where(my_garden_id: current_user.id).first

  end

  def create
    @garden_kit = GardenKit.find(params[:kit_id])
    @garden_kit.kit_plants.each do |kit_plant|
      @my_plant = MyPlant.create(plant: kit_plant.plant, my_garden: current_user.my_garden)
    end
    redirect_to user_garden_path
  end

  def update
    @my_garden = current_user.my_garden
    @garden_kit = GardenKit.find(params[:id])
    @garden_kit.kit_plants.each do |kit_plant|
      @my_plant = MyPlant.create(plant: kit_plant.plant, my_garden: @my_garden)
    end
    redirect_to user_garden_path
  end

  def watered
    @my_plant = MyPlant.find(params[:id])
    @my_plant.water_level = Time.now.yday
    @my_plant.save
    redirect_to user_garden_path(tab: :water)
  end
end
