class GardenKitsController < ApplicationController
  def index
    @garden_kits = GardenKit.all
  end
end
