class MyPlantsController < ApplicationController
  def show
    @my_plant = MyPlant.find(:id)
  end

#   def new
#     @garden_kits.plants.each do ||
#     end
#   end
# end
