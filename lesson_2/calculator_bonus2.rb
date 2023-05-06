# Ask the user for two numbers
# Ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# As you program more, you'll start to realize that there's no such thing as a program that's "done". Here are a few bonus features you can tackle if you're up for it. They're optional, so if you're in a rush, you don't have to do them.

def prompt(message)
  Kernel.puts("=> #{message}")
end

# 2. Number validation
# Suppose we're building a scientific calculator, and we now need to account for inputs that include decimals. How can we build a validating method, called number?, to verify that only valid numbers -- integers or floats -- are entered?

def float_or_int?(input)
  input.to_f.to_s == input || input.to_i.to_s == input
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end
prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do #main loop

  number1 = ''

  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if float_or_int?(number1)
      break
    else
      puts number1
      prompt("Hm... that doesn't look like a valid number.")
    end
  end

  number2 = ''

  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if float_or_int?(number2)
      break
    else
      prompt("Hm... that doesn't look like a valid number.")
    end
  end


  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
    when "1"
      number1.to_f() + number2.to_f()
    when "2"
      result = number1.to_f() - number2.to_f()
    when "3"
      result = number1.to_f() * number2.to_f()
    when "4"
      result = number1.to_f() / number2.to_f()
  end

  prompt("The result is #{result}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt("Thank you for using the calculator. Good bye.")
