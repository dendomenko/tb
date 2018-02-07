class PassengerTrain < Train
  def initialize(id)
    super id
  end

  def printer
    super
    puts '| type: passenger'
    carriages
  end
end
