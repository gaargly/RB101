# Load in Configuration File
require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

# Methods
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  (num.to_i.to_s == num || num.to_f.to_s == num) &&
  (num.to_i > 0 || num.to_f > 0)
end

# Welcome the user
prompt(MESSAGES['welcome'])

# Ask for 3 pieces of input: loan amount, APR, loan duration
# loan amount
loan_amount = ''
loop do
  prompt(MESSAGES['loan_amount'])

  loan_amount = Kernel.gets().chomp()

  if valid_number?(loan_amount)
    break
  else
    prompt(MESSAGES['invalid_num'])
  end
end

# APR
apr = ''
loop do
  prompt(MESSAGES['apr'])

  apr = Kernel.gets().chomp()

  if valid_number?(apr)
    break
  else
    prompt(MESSAGES['invalid_num'])
  end
end

# loan duration
loan_duration_in_years = ''
loop do
  prompt(MESSAGES['loan_duration_in_years'])

  loan_duration_in_years = Kernel.gets().chomp()

  if valid_number?(loan_duration_in_years)
    break
  else
    prompt(MESSAGES['invalid_num'])
  end
end

# Calculate: monthly interest rate, loan duration in months, monthly payment
Kernel.puts("Your Loan Amount Is: $#{loan_amount}")

monthly_interest_rate = apr.to_f / 100 / 12
Kernel.puts("Your Monthly Interest Rate Is: #{monthly_interest_rate.round(4)}%")

loan_duration_in_months = loan_duration_in_years.to_f * 12
Kernel.puts("Your Loan Will Last For: #{loan_duration_in_months} months")

monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))

Kernel.puts("Your Monthly Payment Will Be: $#{monthly_payment.round(2)}")
