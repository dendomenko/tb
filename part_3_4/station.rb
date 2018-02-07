class Station
  attr_reader :name
  def initialize(name)
    @name = name
    @trains = []
  end

  def train_arrive(train)
    @trains.push train
  end

  def train_depart(train)
    @trains.delete train
  end

  def trains
    puts "Trains on this station: #{@name}"
    @trains.each(&:print)
  end

  def trains_by_type(type = 'passenger_train')
    @trains.each do |train|
      train.print if train.class == type
    end
  end

  def print
    puts "Name: #{@name}"
  end
end
