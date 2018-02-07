class Carriage
  include Manufacturer
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def printer
    print "Carriage number: #{number}"
  end
end
