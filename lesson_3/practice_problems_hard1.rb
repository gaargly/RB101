# Question 1
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = "hello world"
end

greeting

# I expect to see nil since the parser creates a local variable greeting even if its value is not set because the code path doesn't execute.

# Question 2
# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# greetings[:a] has the same object_id as informal_greeting, so anything that mutates informal_greeting will mutate greetings[:a]. Therefore, I would expect the mutating operation << to change greetings such that greetings is now { a: 'hi there'}

# Launch School Answer
# If instead of modifying the original object, we wanted to only modify informal_greeting but not greetings, there are a couple of options:
#
# we could initialize informal_greeting with a reference to a new object containing the same value by informal_greeting = greetings[:a].clone.
# we can use string concatenation, informal_greeting = informal_greeting + ' there', which returns a new String object instead of modifying the original object.

# Question 3

# In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A)

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three) # the string object "one" is passed into the method mess_with_vars as the first argument, i.e. the method parameter one is set to "one". The string object "two" is passed into the method mess_with_vars as the second argument, i.e. the method parameter two is set to "two". The string object "three" is passed into the method mess_with_vars as the third argument, i.e. the method parameter three is set to "three".

# Then, in the method definition, the method parameter one is set to the string object represented by the method parameter two, effectively meaning that one is now equal to "two". Similarly, the method parameter two is set to the string object represented by the method parameter three, effectively meaning that two is now equal to "three". Lastly, the method parameter three is set to the string object represented by the method parameter one, which we previously set to "two."

# So, INSIDE of the method, we have now: one == "two"; two == "three"; three == "two"

# But OUTSIDE the method, the local variables one, two, three were not mutated by any operations inside of the method invocation, so they are still their original values.

puts "one is: #{one}" # "one"
puts "two is: #{two}" # "two"
puts "three is: #{three}" # "three"

# B)

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # The value of one stays the same as the local variable one that's outside the method.
puts "two is: #{two}" # The value of two stays the same as the local variable two that's outside the method.
puts "three is: #{three}" # The value of three stays the same as the local variable three that's outside the method.

# C)

def mess_with_vars(one, two, three)
  one.gsub!("one","two") # This is a mutating operation that will change the argument passed into the method during the method invocation.
  two.gsub!("two","three") # This is a mutating operation that will change the argument passed into the method during the method invocation.
  three.gsub!("three","one") # This is a mutating operation that will change the argument passed into the method during the method invocation.
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # "two"
puts "two is: #{two}" # "three"
puts "three is: #{three}" # "one"

# Question 4
# Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number? that determines if a string is a numeric string between 0 and 255 as required for IP numbers and asked Ben to use it.

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
# Help Ben fix his code.

def is_an_ip_number?(num)
  (0..255).cover?(num)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  if dot_separated_words.size != 4
    return false
  else
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop.to_i
      if !is_an_ip_number?(word)
        return false
        break
      elsif is_an_ip_number?(word)
        return true
        break
      end
    end
  end
end

dot_separated_ip_address?("10.4.5.11")

# Launch School Answer

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4 # This will stop execution after the explicit return false

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop.to_i
    return false unless is_an_ip_number?(word) # This will stop execution after the explicit return false
  end

  true # if everything above runs without explicitly returning false (i.e. the argument passed into the method is 4 numbers long and each number is_an_ip_number, then execution will get to this point, which essentially is returning true.
end
