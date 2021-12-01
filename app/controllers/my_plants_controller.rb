class MyPlantsController < ApplicationController
  def show
    @my_plant = MyPlant.find(:id)
  end

  def create
    @my_plant = MyPlant.create(Plant.id)
  end

  def update
    @my_plant = MyPlant.find(params[:id])
    if @my_plant.active
      @my_plant.update(active: false)
    else
      @my_plant.update(active: true)
    end

    respond_to do |format|
      format.html { redirect_to user_garden_path }
      format.text { render partial: 'my_garden/card_my_plant_infos', locals: { my_plant: @my_plant }, formats: [:html] }
    end
  end

  private

  def my_plant_params
    params.require(:my_plant).permit(:active)
  end
end
