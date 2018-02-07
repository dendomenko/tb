class CargoCarriage < Carriage
  attr_reader :occupied_volume
  def initialize(volume, number)
    super number
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

  def printer
    super
    puts "type: #{@type}, free volumr: #{free_volume}," /
         " occupied volume: #{occupied_volume}"
  end
end
