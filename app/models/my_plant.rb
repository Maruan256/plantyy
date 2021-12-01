class MyPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :my_garden

  before_create :planted
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
      "all good, your plant is fine."
    elsif Time.now - self.water_level < self.plant.water.to_i && Time.now - self.water_level > 360000
      "you need to water your plant soon!"
    else
      "Quick! Water! Your plant is dying!"
    end
  end
end
