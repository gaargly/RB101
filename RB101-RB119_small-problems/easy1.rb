# 1. Repeat Yourself

def repeat(str, num)
  num.times {puts str}
end

repeat('Hello', 3)

# 2. Odd

def is_odd?(num)
  num.abs % 2 != 0
end

# 3. Stringy Strings

def stringy(num)
  if num % 2 == 0
    return "10" * (num / 2)
  else
    return "10" * (num / 2) + "1"
  end
end

# 4. What's my Bonus?

def calculate_bonus(num, bool)
  bool ? (num / 2) : 0
end

# 5. Bannerizer
def print_in_box(str)
  puts '+-' + '-' * str.size + '-+'
  puts '| ' + ' ' * str.size + ' |'
  puts '|' + ' ' + str + ' ' + '|'
  puts '| ' + ' ' * str.size + ' |'
  puts '+-' + '-' * str.size + '-+'
end
