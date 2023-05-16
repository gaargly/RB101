# Question 1
# In this hash of people and their age,

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if "Spot" is present.
# Bonus: What are two other hash methods that would work just as well for this solution?

ages.include?("Spot")
ages.key?("Spot")

# Question 2
# Starting with this string:
munsters_description = "The Munsters are creepy in a good way."

# Convert the string in the following ways (code will be executed on original munsters_description above):

# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.swapcase!
# "The munsters are creepy in a good way."
munsters_description.capitalize!
# "the munsters are creepy in a good way."
munsters_description.downcase!
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.upcase!


# Question 3
# We have most of the Munster family in our age hash. add ages for Marilyn and Spot to the existing hash

additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

# Question 4
# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?("Dino")

# Launch School Answer: # Note that this is not a perfect solution, as it would match any substring with Dino in it.
advice.match?("Dino")

# Question 5
# Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

flintstones = %w(Fred, Barney, Wilma, Betty, BamBam, Pebbles)

# Question 6
# How can we add the family pet "Dino" to our usual array:
flintstones << "Dino"

# Question 7
# How can we add multiple items to our array? (Dino and Hoppy)
flintstones << "Dino" << "Hoppy"

# OR
flintstones.push("Dino", "Hoppy")

# Question 8
# Shorten the following sentence:

advice = "Few things in life are as important as house training your pet dinosaur."

# Review the String#slice! documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

advice.slice!("Few things in life are as important as ")

# As a bonus, what happens if you use the String#slice method instead?

# If we use the String#slice method instead of the String#slice! method, the return value is still "Few things in life are as important as " but the original advice variable still points to the full sentence.

# Question 9
# Write a one-liner to count the number of lower-case 't' characters in the following string:

statement = "The Flintstones Rock!"
statement.count("t")

# Question 10
# Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a table of Flintstone family members that was forty characters in width, how could we easily center that title above the table with spaces?

title = "Flintstone Family Members"

title.center(40)
