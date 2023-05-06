# For example, write out pseudo-code (both casual and formal) that does the following:

a method that returns the sum of two integers

# Casual pseudo-code
Given two integers.
Add the second integer to the first integer.
Return the result.

# Formal pseudo-code
START
# Given two integers (as arguments passed into a method call)
ADD the second integer to the first integer # Implicit return
END

---

a method that takes an array of strings, and returns a string that is all those strings concatenated together

# Casual pseudo-code
Given an array of strings.
Set a new variable to the strings concatenated together.
Return the value of the new variable.

# Formal pseudo-code
START
Given an array of strings
SET result = strings concatenated together
RETURN result # or implicit return on line above?
END

---

a method that takes an array of integers, and returns a new array with every other element from the original array, starting with the first element. For instance:

every_other([1,4,7,2,5]) # => [1,7,5]

# Casual pseudo-code
Given an array of integers.
Initialize a new variable that is of type array.
Iterate through the given array of integers.
  - Save the current value to new array
  - Bump iterator up by 2 instead of 1
Return new array.

# Formal pseudo-code
START
# Given an array of integers
SET new_arr = []
SET iterator = 1

WHILE iterator <= length of new_arr
  Push current_value to new_arr
  iterator = iterator + 2

RETURN new_arr
END

---

a method that determines the index of the 3rd occurrence of a given character in a string. For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

# Casual pseudo-code
Given a character.
Create a new integer variable (counter) to keep track of how many times the character appears.
Iterate through a string.
If current_value == character, bump the value of the counter by 1.
if counter == 3, return index of current_value in the string.
  exit loop
else return nil


# Formal pseudo-code
START
# Given a character & a string
SET counter = 0
SET iterator = 0

WHILE iterator <= 3
  counter += 1
  IF counter == 3
    RETURN index of current_value
    NEXT
  ELSE
    RETURN nil
END

---

a method that takes two arrays of numbers and returns the result of merging the arrays. The elements of the first array should become the elements at the even indexes of the returned array, while the elements of the second array should become the elements at the odd indexes. For instance:

merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

# Casual pseudo-code
Given two arrays.
Create a new array.
Iterate through the two given arrays in this pattern and push current value to the new array:
  - [0][0]
  - [1][0]
  - [0][1]
  - [1][1]
  - [0][2]
  - [1][2]
Return the new array.

# Formal pseudo-code
START
# Given two arrays
SET new_arr = []
SET iterator = 0
WHILE iterator <= length of first given array
  push first_given_array[iterator] to new_arr
  push second_given_array[iterator] to new_arr
  iterator = iterator + 1
RETURN new_arr
END
