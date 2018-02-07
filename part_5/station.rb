class Station
  attr_reader :name
  @@instances = []

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@instances.push self
    printer
  end

  def self.all
    @@instances.each(&:printer)
  end

  def train_arrive(train)
    @trains.push train
  end

  def train_depart(train)
    @trains.delete train
  end

  def trains
    puts "Trains on this station: #{@name}"
    if block_given?
      @trains.each do |train|
        yield train
      end
    else
      @trains.each(&:printer)
    end
  end

  def trains_by_type(type = 'passenger_train')
    @trains.each do |train|
      train.print if train.class == type
    end
  end

  def printer
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
