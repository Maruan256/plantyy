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
    # if @garden_kit == nil
    #   @garden_kit = GardenKit.find(params[:garden_kit_id])
    # end
    @plants = @garden_kit.plants
    @review = Review.new
  end

end
