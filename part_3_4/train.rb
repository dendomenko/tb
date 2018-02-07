class Train
  attr_reader :id, :carriage_number, :station_index
  attr_writer :route
  attr_accessor :speed

  def initialize(id)
    @speed = 0
    @id = id
    @carriages = []
    @station_index = 0
  end

  protected

  def speed_rise
    @speed += 10
  end

  def stop
    @speed = 0
  end

  def current_station
    @route.stations[@station_index].print
  end

  def next_station
    @route.stations[@station_index + 1].print
  end

  def prev_station
    @route.stations[@station_index - 1].print
  end

  def go_to_next_station
    @station_index += 1
  end

  def remove_carriage
    return 'Stop the train before removing carriage!' unless @speed.zero?
    return 'You have not any carriage' if @carriages.size.zero?
    @carriages.pop
  end

  def add_carriage
    return 'Stop the train before adding carriage!' unless @speed.zero?
    case self.class
    when 'PassengerTrain'
      @carriages.push PassengerCarriage.new
    when 'CargoTrain'
      @carriages.push CargoCarriage.new
    end
  end
end
