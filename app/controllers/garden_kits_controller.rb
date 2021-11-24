class GardenKitsController < ApplicationController
  def index
    @garden_kits = GardenKit.all
  end

  def show
    @garden_kits = GardenKit.find(params[:id])
  end
end
