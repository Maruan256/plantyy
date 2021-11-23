class PlantsController < ApplicationController
  def show
    @plant = Plant.find(params[:id])
  end
end
