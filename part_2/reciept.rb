def menu
  list = {}
  loop do
    menu_points
    choice = gets.chomp
    case choice
    when '1'
      add_product list
    when '2'
      show_data list
    when '3'
      puts show_total list
    when '0'
      break
    else
      puts 'Wrong input'
    end
  end
end

def menu_points
  puts '1. Add product'
  puts '2. Show data'
  puts '3. Show total'
  puts '0. Exit'
end

def add_product(list)
  puts 'Enter product info, to exit print stop in product name'
  loop do
    puts 'Enter product name:'
    product = gets.chomp
    break if product == 'stop'
    puts 'Enter product price:'
    price = gets.chomp.to_i
    puts 'Enter product quantity:'
    qty = gets.chomp.to_i
    list[product] = { price: price, qty: qty }
  end
end

def show_data(list)
  list.each do |key, value|
    total = value[:price] * value[:qty]
    puts "Product: #{key},  price: #{value[:price]}," \
    " quantity: #{value[:qty]}, total: #{total}"
  end
end

def show_total(list)
  total = 0
  list.each_value do |product|
    total += product[:price] * product[:qty]
  end
  total
end
