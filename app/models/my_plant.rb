class MyPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :my_garden
  before_create :planted
  def planted
    self.water_level = [333, 334, 332].sample
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
    Time.now.yday - self.water_level
  end
end
