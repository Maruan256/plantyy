class MyGardenController < ApplicationController

  def show
    @my_garden = MyGarden.where(user_id: current_user.id)
    # @my_plants = @my_garden.my_plants
  end
end
