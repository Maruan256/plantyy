class GardenKitsController < ApplicationController
  def index
    @garden_kits = GardenKit.order(kit_name: :asc)

    if params[:query].present?
      @garden_kits = @garden_kits.where('kit_name ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
    format.html # Follow regular flow of Rails
    format.text { render partial: 'garden_kits/list', locals: { garden_kits: @garden_kits }, formats: [:html] }
    end
  end

  def show
    @garden_kit = GardenKit.find(params[:id])
    @plants = @garden_kit.plants
  end
end
