def quadratic_equation
  puts 'Введите коэффициент а:'
  a = gets.chomp.to_i
  puts 'Введите коэффициент b:'
  b = gets.chomp.to_i
  puts 'Введите коэффициент c:'
  c = gets.chomp.to_i
  d = b * 2 - 4 * a * c
  if d > 0
    x1 = (-b + Math.sqrt(d)) / 2 * a
    x2 = (-b - Math.sqrt(d)) / 2 * a
    puts "D = #{d}, x1 = #{x1}, x2 = #{x2}"
  elsif d.zero?
    x = -b / (2 * a)
    puts "D = #{d}, x1 = x2 = #{x}"
  else
    puts "D = #{d}, корней нет"
  end
end

check