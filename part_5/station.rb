class Station
  extend Accessors
  include Validation

  validate :name, :presence
  validate :name, :type, String

  attr_reader :name
  attr_accessor_with_history :test
  strong_attr_acessor :test2, String

  @@instances = []

  def initialize(name)
    @name = name
    @trains = []
    # validate!
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
end
