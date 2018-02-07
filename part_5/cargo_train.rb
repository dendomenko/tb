class CargoTrain < Train
  def initialize(id)
    super id
  end

  def printer
    super
    puts '| type: cargo'
    carriages
  end
end
