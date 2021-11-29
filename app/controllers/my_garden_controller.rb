class MyGardenController < ApplicationController

  def show
    @my_garden = MyGarden.find(params[:id])
    @my_plants = @my_garden.my_plants
    @garden_photo = GardenKit.where(my_garden_id: current_user.id).first
  end

  def create
    unless @my_garden.present?
      @my_garden = MyGarden.create(user_id: current_user.id, my_garden_name: current_user.first_name)
    end
    @garden_kit = GardenKit.find(params[:kit_id])
    @garden_kit.kit_plants.each do |kit_plant|
      @my_plant = MyPlant.create(plant: kit_plant.plant, my_garden: @my_garden)
    end
    redirect_to my_garden_path(@my_garden)
  end

  def update
    @my_garden = MyGarden.find(params[:id])
    @garden_kit = GardenKit.find(params[:kit_id])
    @garden_kit.kit_plants.each do |kit_plant|
      @my_plant = MyPlant.create(plant: kit_plant.plant, my_garden: @my_garden)
    end
    redirect_to my_garden_path(@my_garden)
  end
end
