class Route
  attr_reader :stations
  def initialize(start_st, end_st)
    @stations = [start_st, end_st]
    validate!
  end

  def add_inter_station(station)
    @stations.insert(-2, station) unless @stations.include? station
  end

  def remove_inter_station(station)
    @stations.delete station
  end

  def station_list
    @stations.each(&:print)
  end

  def valid?
    validate!
  rescue RuntimeError
    false
  end

  private

  def validate!
    raise 'Start and end station must be set' if stations.nil?
    raise 'Start station must be a station' unless stations[1].class == Station
    raise 'End station must be a station' unless stations[-1].class == Station
    true
  end
end
