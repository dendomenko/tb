class PassengerCarriage < Carriage
  def initialize(seats)
    @seats = seats
    @type = 'passenger'
  end
end
