class Station
  attr_reader :name
  @@instances = []

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@instances.push self
    print
  end

  def self.all
    @@instances.each(&:print)
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
  
  def valid?
    validate!
  rescue RuntimeError
    false
  end

  private

  def validate!
    raise "Name can't be nil" if name.nil?
    raise 'Name should be at least 3 symbols' if name.length < 3
    true
  end
end
