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

# 6. Right Triangles

def triangle(num)
  opposite = 0
  limit = num
  while opposite <= limit
    puts " " * num + "*" * opposite
    opposite += 1
    num -= 1
  end
end

# 7. Madlibs

def madlibs()
  puts "Enter a noun: "
  noun = gets.chomp
  puts "Enter a verb: "
  verb = gets.chomp
  puts "Enter an adjective: "
  adjective = gets.chomp
  puts "Enter an adverb: "
  adverb = gets.chomp
  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
end

# 8. Reverse the Digits in a Number

def reversed_number(num)
  num.to_s.reverse.to_i
end

# 9. Get Middle Character

def center_of(str)
  if str.size % 2 != 0
    str[(str.size-1)/2]
  else
    str[(str.size-1)/2] + str[((str.size-1)/2)+1]
  end
end

# Launch School Answer

def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end
