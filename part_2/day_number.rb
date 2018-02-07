
def day_number
  year = check_year
  months = {
    1 => 31,
    2 => leap_year?(year) ? 29 : 28,
    3 => 31,
    4 => 30,
    5 => 31,
    6 => 30,
    7 => 31,
    8 => 31,
    9 => 30,
    10 => 31,
    11 => 30,
    12 => 31
  }
  month = check_month
  max_month_days = months[month]
  day = check_day max_month_days

  days_gone = day
  months.each do |key, value|
    break if key == month
      days_gone += value
  end
  days_gone
end

def check_year
  year = -1
  loop do
    puts 'Введите год:'
    year = gets.chomp.to_i
    break if year > 0
  end
  year
end

def check_month
  month = -1
  loop do
    puts 'Введите месяц'
    month = gets.chomp.to_i
    break if month > 0 && month < 13
  end
  month
end

def check_day(month_days)
  day = -1
  loop do
    puts 'Введите день'
    day = gets.chomp.to_i
    break if day > 0 && day < month_days
  end
  day
end

def leap_year?(year)
  if (year % 4).zero?
    return false if (year % 100).zero? && !(year % 400).zero?
    return true
  end
  false
end
