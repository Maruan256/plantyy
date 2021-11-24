class GardenKitsController < ApplicationController
  def index
    @garden_kits = GardenKit.all
  end

  def show
    @garden_kit = GardenKit.find(params[:id])
  end
end
