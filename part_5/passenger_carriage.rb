class PassengerCarriage < Carriage
  attr_reader :taken_seats
  def initialize(seats, number)
    super number
    @seats = seats
    @type = 'passenger'
    @taken_seats = 0
  end

  def take_seat
    @taken_seats += 1 unless @take_seats == @seats
  end

  def free_seats
    @seats - @taken_seats
  end

  def printer
    super
    puts "type: #{@type}, free seats: #{free_seats}, taken seats: #{taken_seats}"
  end
end
