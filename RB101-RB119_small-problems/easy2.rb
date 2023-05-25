# 1. How old is Teddy?
def teddy()
  random_age = rand(20..200)
  puts "Teddy is #{random_age} years old!"
end

teddy()

# 2. How big is the room?

def room_area()
  puts "Enter the length of the room in meters:"
  length = gets.chomp.to_f
  puts "Enter the width of the room in meters:"
  width = gets.chomp.to_f
  puts "The area of the room is #{length * width} square meters (#{(length * width * 10.7639).round(2)} square feet)."
end

room_area()

# 3. Tip calculator

def tip()
  puts "What is the bill?"
  bill = gets.chomp.to_f
  puts "What is the tip percentage?"
  perc = gets.chomp.to_f / 100

  tip = (bill * perc).round(1)
  total = ((bill * perc)+bill).round(1)
  puts "The tip is: $#{tip}"
  puts "The total is: $#{total}"
end

tip()

# 4. When will I Retire?

def retire()
  puts "What is your age?"
  current_age = gets.chomp.to_i

  puts "At what age would you like to retire?"
  retirement_age = gets.chomp.to_i

  years_to_go = retirement_age - current_age

  current_year = Time.now.year
  retirement_year = Time.now.year + years_to_go

  puts "It's #{current_year}. You will retire in #{retirement_year}."
  puts "You only have #{years_to_go} years of work to go!"
end

retire()

# 5. Greeting a user

def greet()
  puts "What is your name?"
  name = gets.chomp

  if name[-1] == "!"
    puts "HELLO #{name[0..-2].upcase}. WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}."
  end
end

greet()

# 6. Odd numbers

(1..99).each {|num| puts num if num.odd? }

# 7. Even Numbers

(1..99).each {|num| puts num if num.even? }

# 8. Sum or Product of Consecutive Integers

def sum_or_product()
  puts ">> Please enter an integer greater than 0."
  limit = gets.chomp.to_i
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp

  if operation == 's'
    sum = 0
    (1..limit).each {|x| sum += x}
    sum
  elsif operation == "p"
    product = 1
    (1..limit).each {|x| product *= x}
    product
  end
end

sum_or_product()

# 9. String Assignment
name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# This should print:
Alice
Bob

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# This should print:
BOB
BOB

# 10. Always Return Negative

def negative(num)
  if !num.to_i.negative?
    -(num.to_i)
  else
    num
  end
end

negative(5) == -5
negative(-3) == -3
negative(0) == 0      # There's no such thing as -0 in ruby
