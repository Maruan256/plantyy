class MyPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :my_garden
  before_create :planted
  def planted
    self.water_level = Time.now.yday
    self.fertilizer_level = Time.now.yday
    self.harvest_level = Time.now.yday
  end

  def watered
    self.water_level = Time.now.yday
  end

  def fertilzed
    self.fertilizer_level = Time.now.yday
  end

  def harvested
    self.harvest_level = Time.now.yday
  end

  def check
    if Time.now.yday - self.water_level >= self.plant.water.to_i
      "Quick! Water! Your plant is dying!"
    elsif Time.now.yday - self.water_level < self.plant.water.to_i && Time.now.yday - self.water_level > 1
      "You need to water your plant soon!"
    else
      "All good, your plant is fine."
    end
  end
end
