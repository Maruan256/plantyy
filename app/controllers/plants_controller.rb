class PlantsController < ApplicationController
  def show
    @plant = Plant.find(params[:id])
    @conditons = PlantsCondition.where(plant:@plant)
  end
end
