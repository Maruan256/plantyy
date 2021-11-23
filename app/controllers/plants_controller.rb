class PlantsController < ApplicationController
  def show
    @plants = Plant.find(params[:id])
  end
end
