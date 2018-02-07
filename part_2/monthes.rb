# 1 task
monthes = {
  'Январь' => 31,
  'Февраль' => 28,
  'Март' => 31,
  'Апрель' => 30,
  'Май' => 31,
  'Июнь' => 30,
  'Июль' => 31,
  'Август' => 31,
  'Сентябрь' => 30,
  'Октябрь' => 31,
  'Ноябрь' => 30,
  'Декабрь' => 31
}

monthes.each do |month, days|
  puts month if days == 30
end

# 2 task
array = [10]
while array[-1] != 100
  array << array[-1] + 5
end
puts array

# 3 task
fib = [0]
while fib[-1] < 100
  fib << if fib.size == 1
           1
         else
           fib[-1] + fib[-2]
         end
end
puts fib

# 4 task 
alphabet = {}
('a'..'z').each_with_index do |letter, index|
  alphabet[letter] = index + 1
end
puts alphabet