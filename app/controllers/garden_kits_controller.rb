class GardenKitsController < ApplicationController
  def index
    @garden_kits = GardenKit.order(kit_name: :asc)

    if params[:query].present?
      @garden_kits = @garden_kits.where('kit_name ILIKE ?', "%#{params[:query]}%")
    end
  end

  def show
    @garden_kit = GardenKit.find(params[:id])
    @plants = @garden_kit.plants
  end
end
