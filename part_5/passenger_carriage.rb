class PassengerCarriage < Carriage
  attr_reader :taken_seats
  def initialize(seats)
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
end
