def sides
  puts 'Input triangle sides a,b,c:'
  a = gets.to_i
  b = gets.to_i
  c = gets.to_i
  [a, b, c]
end

def right_triangle(a, b, c)
  a, b, c = [a, b, c].sort
  return true if a**2 + b**2 == c**2
  false
end

def isosceles_triangle(a, b, c)
  return true if (a == b || b == c) || c == a
  false
end

def check_triangle
  a, b, c = sides
  puts 'Треугольник прямоугольный' if right_triangle(a, b, c)
  puts 'Треугольник равнобедренный' if isosceles_triangle(a, b, c)
end