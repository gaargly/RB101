# 1. Searching 101
def search()
  puts "==> Enter the 1st number:"
  first_num = gets.chomp.to_i
  puts "==> Enter the 2nd number:"
  second_num = gets.chomp.to_i
  puts "==> Enter the 3rd number:"
  third_num = gets.chomp.to_i
  puts "==> Enter the 4th number:"
  fourth_num = gets.chomp.to_i
  puts "==> Enter the 5th number:"
  fifth_num = gets.chomp.to_i
  puts "==> Enter the last number:"
  sixth_num = gets.chomp.to_i

  arr = [first_num, second_num, third_num, fourth_num, fifth_num]

  if arr.include?(sixth_num)
    puts "The number #{sixth_num} appears in #{arr}."
  else
    puts "The number #{sixth_num} does not appear in #{arr}."
  end
end

search()

# 2. Arithmetic Integer

def calculate()
  def prompt(message)
    puts "==> #{message}"
  end

  prompt("Enter the first number:")
  first_num = gets.chomp.to_i
  prompt("Enter the second number:")
  second_num = gets.chomp.to_i

  # Addition
  prompt("#{first_num} + #{second_num} = #{first_num + second_num}")
  # Subtraction
  prompt("#{first_num} - #{second_num} = #{first_num - second_num}")
  # Multiplication
  prompt("#{first_num} * #{second_num} = #{first_num * second_num}")
  # Division
  prompt("#{first_num} / #{second_num} = #{first_num / second_num}")
  # Remainder
  prompt("#{first_num} % #{second_num} = #{first_num % second_num}")
  # Power
  prompt("#{first_num} ** #{second_num} = #{first_num ** second_num}")
end

calculate()

# 3. Counting the Number of Characters

def count_characters()
  puts "Please write a word or multiple words: "
  phrase = gets.chomp
  puts "There are #{phrase.split.join.size} characters in #{phrase}."
end

count_characters()

# 4. Multiplying Two Numbers

def multiply(num1, num2)
  num1 * num2
end

multiply(5, 3)


# 5. Squaring an Argument

def square(num)
  multiply(num, num)
end

square(5)
square(-8)

# 6. Exclusive Or

def xor?(statement1, statement2)
  if statement1 != statement2
    true
  else
    false
  end
end

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false

# 7. Palindromic Strings (Part 1)

def palindrome?(str)
  str == str.reverse
end

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

# 8. Palindromic Strings (Part 2)

def real_palindrome?(str)
  str.downcase.gsub(/\W/,'') == str.downcase.gsub(/\W/,'').reverse
end

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

# 9. Palindromic Numbers

def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true

# 10. Uppercase Check

def uppercase?(str)
  str == str.upcase
end

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
