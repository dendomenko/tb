class Route
  attr_reader :stations
  def initialize(start_st, end_st)
    @stations = [start_st, end_st]
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
end
