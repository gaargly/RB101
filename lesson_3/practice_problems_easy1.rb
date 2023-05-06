# Question 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq # Expected printout:
# 1, 2, 3

puts numbers # Expected printout:
# 1
# 2
# 2
# 3

# Question 2
# Describe the difference between ! and ? in Ruby.

# ANSWER: ! can mean "not" or it can express the mutable power of a method. I'm assuming we're talking about the "not" version of ! in this question. ! will negate the subsequent object.

# Whereas ? precedes the evaluation of true or false.

# Question 2 continued
# And explain what would happen in the following scenarios:

# what is != and where should you use it?
# ANSWER: This means "not equal to" and it should be used in conditional statements.

# put ! before something, like !user_name
# ANSWER: If user_name exists and is not nil, !user_name would be falsy, i.e. it would evaluate to false. If user_name does not exist or has a nil value, !user_name would be truthy, i.e. it would evaluate to true.

# put ! after something, like words.uniq!
# ANSWER: This will mutate words to only have unique values.

# put ? before something
# ANSWER: Not sure

# put ? after something
# ANSWER: It will assess whether the preceding object (or statement) is truthy or falsy.

# put !! before something, like !!user_name
# ANSWER: It's like "not not" i.e. it will evaluate to true if user_name is truthy. It will evaluate to false if user_name is falsy.


# LAUNCH SCHOOL ANSWERS:
# Just to clarify, if you see ! or ? at the end of the method, it's actually part of the method name, and not Ruby syntax. Therefore, you really don't know what the method is doing, even if it ends in those characters -- it depends on the method implementation.

# The other uses are actual Ruby syntax:

# != means "not equals"
# ? : is the ternary operator for if...else
# !!<some object> is used to turn any object into their boolean equivalent. (Try it in irb)
# !<some object> is used to turn any object into the opposite of their boolean equivalent, just like the above, but opposite.


# Question 3
# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

# ANSWER
advice.gsub!('important', 'urgent')

# Question 4
# The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?
numbers.delete_at(1) # This will delete the value at index 1 i.e. it will delete numbers[1] which is 2.

numbers = [1, 2, 3, 4, 5]

numbers.delete(1) # This will delete the value 1 so numbers will start with the value 2.

# Question 5
# Programmatically determine if 42 lies between 10 and 100.
# hint: Use Ruby's range object in your solution.

(10..100).cover?(42)

# Question 6
# Starting with the string:

famous_words = "seven years ago..."

# show two different ways to put the expected "Four score and " in front of it.

# ANSWER 1
famous_words = "Four score and  " << famous_words

# ANSWER 2
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")

# Question 7
# If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array:
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

# Make this into an un-nested array.
flintstones.flatten!

# Question 8
# Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Create an array containing only two elements: Barney's name and Barney's number.
barney_arr = flintstones.to_a[2]
# LAUNCH SCHOOL ANSWER
flintstones.assoc("Barney")
