class GardenKitsController < ApplicationController
  def index
    @garden_kits = GardenKit.all
  end

  def show
<<<<<<< HEAD
    @garden_kits = GardenKit.find(params[:id])
=======
    @garden_kit = GardenKit.find(params[:id])
    @plants = @garden_kit.plants
>>>>>>> master
  end
end
