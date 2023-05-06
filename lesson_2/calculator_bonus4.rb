# Ask the user for two numbers
# Ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

# As you program more, you'll start to realize that there's no such thing as a program that's "done". Here are a few bonus features you can tackle if you're up for it. They're optional, so if you're in a rush, you don't have to do them.

# 4. Extracting messages in the program to a configuration file.

# There are lots of messages sprinkled throughout the program. Could we move them into some configuration file and access by key? This would allow us to manage the messages much easier, and we could even internationalize the messages.

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def float_or_int?(input)
  input.to_f.to_s == input || input.to_i.to_s == input
end

def operation_to_message(op)
  word = case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
  word
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES['invalid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do #main loop

  number1 = ''

  loop do
    prompt(MESSAGES['first_num'])
    number1 = Kernel.gets().chomp()

    if float_or_int?(number1)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end

  number2 = ''

  loop do
    prompt(MESSAGES['second_num'])
    number2 = Kernel.gets().chomp()

    if float_or_int?(number2)
      break
    else
      prompt(MESSAGES['invalid_num'])
    end
  end

  prompt(MESSAGES['operator_prompt'])

  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['invalid_operator'])
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
  prompt(MESSAGES['again'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt(MESSAGES['thanks'])
