# method calculate your perfect weight
def perfect_weight
  puts 'Put your name, please:'
  name = gets.chomp
  height = check_height
  while height.zero?
    height = check_height
  end
  perfect_weight = height.to_i - 110
  if perfect_weight < 0
    puts "#{name}, your weight is perfect!"
  else
    puts "your perfect weight is #{perfect_weight}"
  end
end

def check_height
  puts 'Put your height, please:'
  gets.chomp.to_i
end

perfect_weight