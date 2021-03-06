def menu
  stations = [Station.new('Kharkiv'), Station.new('Kyiv'), Station.new('Dnepr')]
  trains = [
    PassengerTrain.new('KKD'),
    PassengerTrain.new('DKK-12'),
    CargoTrain.new('KDK-22')
  ]

  trains.each do |train|
    train.add_carriage(rand(15..35))
    train.add_carriage(rand(15..35))
    train.add_carriage(rand(15..35))
  end

  stations.each_with_index do |station, index|
    station.train_arrive trains[index]
  end

  loop do
    menu_points
    choice = gets.chomp
    case choice
    when '1'
      add_station stations
    when '2'
      add_train trains
    when '3'
      add_carriage trains
    when '4'
      remove_carriage trains
    when '5'
      add_train_to_station(trains, stations)
    when '6'
      print_stations stations
    when '0'
      break
    else
      puts 'Wrong input'
    end
  end
end

def menu_points
  puts '1. Add station'
  puts '2. Add train'
  puts '3. Add cariage to train'
  puts '4. Remove cariage from train'
  puts '5. Add train to the station'
  puts '6. Stations list'
  puts '0. Exit'
end

def add_station(stations)
  puts 'Enter station name'
  name = gets.chomp
  stations.push Station.new(name)
rescue RuntimeError
  puts $!.message
  retry
end

def add_train(trains)
  puts 'Choose train type:'
  puts '1. Passenger (default)'
  puts '2. Cargo'
  type = gets.chomp.to_i
  trains.push create_train(type)
end

def create_train(type)
  puts 'Enter train number:'
  number = gets.chomp
  return CargoTrain.new(number) if type == 2
  PassengerTrain.new(number)
rescue RuntimeError
  puts $!.message
  retry
end

def check_trains(trains)
  trains.size.zero?
end

def add_carriage(trains)
  return 'You should create trains first' if check_trains trains
  printer trains
  puts 'Enter train index to add carriage:'
  index = gets.chomp.to_i
  puts 'Enter volume for cargo train' \
        'or seats for passenger train'
  carriage_data = gets.chomp.to_i
  trains[index].add_carriage(carriage_data) unless trains[index].nil?
end

def remove_carriage(trains)
  if check_trains trains
    puts 'You should create trains first'
  else
    printer trains
    puts 'Enter train index to remove carriage:'
    index = gets.chomp.to_i
    trains[index].remove_carriage unless trains[index].nil?
  end
end

def add_train_to_station(trains, stations)
  t_i = choose_train
  puts 'Enter station index'
  printer stations
  s_i = gets.chomp.to_i
  stations[s_i].train_arrive trains[t_i] unless stations[s_i].nil? ||
                                                trains[t_i].nil?
end

def choose_train
  printer trains
  puts 'Enter train index'
  gets.chomp.to_i
end

def printer(objects)
  objects.each_with_index do |object, index|
    print "#{index}. "
    object.printer
  end
end

def print_stations(stations)
  stations.each(&:trains)
end
