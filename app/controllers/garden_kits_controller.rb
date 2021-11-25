class GardenKitsController < ApplicationController
  def index
    @garden_kits = GardenKit.all
  end

  def show
    @garden_kit = GardenKit.find(params[:id])
    @plants = @garden_kit.plants
  end
end
