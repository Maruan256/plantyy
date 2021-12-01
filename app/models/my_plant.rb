class MyPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :my_garden

  def planted
    self.water_level = Time.now
    self.fertilizer_level = Time.now
    self.harvest_level = Time.now
  end

  def watered
    self.water_level = Time.now
  end

  def fertilzed
    self.fertilizer_level = Time.now
  end

  def harvested
    self.harvest_level = Time.now
  end

  def check
    if Time.now - self.water_level >= self.plant.water.to_i
      "all_good"
    elsif Time.now - self.water_level < self.plant.water.to_i && Time.now - self.water_level > 360000
      "water_soon"
    else
      "water_now"
    end
  end
end
