# Question 1
# Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

# For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
   The Flintstones Rock!
    The Flintstones Rock!
     The Flintstones Rock!
      The Flintstones Rock!
       The Flintstones Rock!
        The Flintstones Rock!
         The Flintstones Rock!

# Answer
(0..9).each {|n| puts " " * n + "The Flintstones Rock!"}

# Launch School answer
10.times {|number| puts (" " * number + "The Flintstones Rock!")}


# Question 2
# The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)

# Why is this and what are two possible ways to fix this?
# This errors because the + method will not concatenate between two data types like this. + (40 + 2) can't be coerced into a string.

# We can fix it by using string interpolation:
puts "the value of 40 + 2 is #{(40 + 2)}"

# This would also work
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Question 3
# Alan wrote the following method, which was intended to show all of the factors of the input number:

def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

# Alyssa noticed that this will fail if the input is 0, or a negative number, and asked Alan to change the loop. How can you make this work without using the begin/end until construct? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

# My Answer
def factors(num)
  divisor = num
  factors = []
  if num <= 0
    puts "Sorry, we're not looking to find the factors for 0 or negative numbers."
  else
    loop do
      factors << num / divisor if num % divisor == 0
      divisor -= 1
      break if divisor == 0
    end
  end
  factors
end

# Launch School Answer
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 # Use while loop
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Bonus 1
# What is the purpose of the number % divisor == 0 ?
# ANSWER: The purpose of this is to implement the definition "factor." Factor is defined as a number that divides the given number without any remainder. We're looking for no remainders when the number that is passed into the factors method as an argument is being divided by progressively smaller divisors.

# Bonus 2
# What is the purpose of the second-to-last line (line 8) in the method (the factors before the method's end)?
# ANSWER: The purpose of the second-to-last line is to return the factors array explicitly.

# Question 4
# Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

# She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to concatenate an element to the buffer?

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element # This uses the mutating method << which means that the object that the variable buffer is pointing to (i.e. the input array) will be mutated and this change will persist next time buffer's value is referenced.
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element] # This uses reassignment with the = operator, which means that the variable buffer will now point to a different object than the one represented by the parameter input_array which is now set to whatever argument was used. The original input array will not change.
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# Launch School Answer

# Yes, there are several differences.

# Both methods have the same return value. However, the first implementation returns a reference to the object passed in as the buffer argument, while the second returns a new object. Furthermore, the first implementation mutates the argument given by the buffer argument, while the second does not mutate its input_array argument. That is, the code that calls rolling_buffer1 will see a modified array after the method returns, while the code that calls rolling_buffer2 will not see any changes in the array.

# It's also worth nothing that Alyssa's first solution both returns a meaningful value and has a side effect. As we learned earlier, that's something we should avoid. Thus, the second solution is probably the better of the two.

# See object_ids of relevant objects below:

def rolling_buffer1(buffer, max_buffer_size, new_element)
  puts "Before << mutation: #{buffer.object_id}"
  buffer << new_element
  puts "After << mutation: #{buffer.object_id}"
  buffer.shift if buffer.size > max_buffer_size
  puts "After shift mutation: #{buffer.object_id}"
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  puts "Before reassignment, input_array's object_id: #{input_array.object_id}"
  buffer = input_array + [new_element]
  puts "After reassignment, input_array's object_id: #{input_array.object_id}"
  puts "After reassignment, buffer's object_id: #{buffer.object_id}"
  buffer.shift if buffer.size > max_buffer_size
  puts "After shift mutation, input_array's object_id: #{buffer.object_id}"
  puts "After shift mutation, buffer's object_id: #{buffer.object_id}"
  buffer
end

# Question 5
# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit # local variable limit is outside the scope of this method
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# My Answer: I would define limit as an argument to the method

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 5) # I would pass the limit into the method fib when calling fib
puts "result is #{result}"

# Question 6
# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # This will print 34 because answer was not mutated by the operation in the mess_with_it method.

# Question 7
# One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:
mess_with_demographics(munsters)

# Did the family's data get ransacked? Why or why not?
# Yes, the family's data gets messed up.

# Launch School Answer
# Spot's demo_hash is pointing to the munsters hash. In this case, the program does not create a new hash for the result -- it just uses the existing hash as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash.

# Question 8

# Method calls can take expressions as arguments. Suppose we define a method called rps as follows, which follows the classic rules of rock-paper-scissors game: it returns the winning fist or, in the case of a tie, the fist that both players played.

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

# What is the result of the following call?
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# My answer: paper

# Launch School Answer
# The outermost call is evaluated by determining the result of rps(rps("rock", "paper"), rps("rock", "scissors")) versus rock. In turn that means we need to evaluate the two separate results of rps("rock", "paper") and rps("rock", "scissors") and later combine them by calling rps on their individual results. Those innermost expressions will return "paper" and "rock", respectively. Calling rps on that input will return "paper". Which finally when evaluated against "rock" will return "paper".

# Question 9
# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?
bar(foo)

# My answer: "no"
# This is because when foo() is called, the return value is always "yes". That means, we pass "yes", i.e the return value of foo(), as an argument to bar when we say bar(foo). Which essentially means we're saying bar("yes"). The parameter param in bar() is set to "yes" and then param == "no" is like saying "yes" == "no" which evaluates to false so the last part of the ternary operation "no" is what is returned.
