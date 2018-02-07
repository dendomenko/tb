class CargoCarriage < Carriage
  attr_reader :occupied_volume
  def initialize(volume)
    @volume = volume
    @occupied_volume = 0
    @type = 'cargo'
  end

  def occupy_volume(volume)
    @occupied_volume += volume if volume <= free_volume
  end

  def free_volume
    @volume - occupied_volume
  end
end
