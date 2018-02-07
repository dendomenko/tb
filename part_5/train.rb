class Train
  attr_reader :id, :carriage_number, :station_index
  attr_writer :route
  attr_accessor :speed

  include Manufacturer
  include InstanceCounter

  @@instances = []

  NAME_PATTERN = /^(([a-z]|\d){3})(-{1}([a-z]|\d){2})?$/i

  def initialize(id)
    @speed = 0
    @id = id
    @carriages = []
    @station_index = 0
    register_instance
    validate!
    @@instances.push self
    print
  end

  def self.find(id)
    result = nil
    @@instances.each do |train|
      result = train if train.id == id
    end
    result
  end

  def valid?
    validate!
  rescue RuntimeError
    false
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

  def carriages
    puts "Carriages on this train: #{@id}"
    if block_given?
      @carriages.each do |carriage|
        yield carriage
      end
    else
      @carriages.each(&:print)
    end
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

  def validate!
    raise "Name can't be nil" if id.nil?
    raise 'Name should be at least 3' \
          'symbols and not more than 5' if id.length < 3 || id.length > 6
    raise 'Name has invalid format' if id !~ NAME_PATTERN
    true
  end
end
