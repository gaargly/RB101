VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'rock' && second == 'scissors')
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

def count_player_wins(player, computer, number_of_player_wins)
  if win?(player, computer)
    number_of_player_wins += 1
  end
  number_of_player_wins
end

def count_computer_wins(computer, player, number_of_computer_wins)
  if win?(computer, player)
    number_of_computer_wins += 1
  end
  number_of_computer_wins
end

player_win_total = 0
computer_win_total = 0

loop do # MAIN LOOP
  if player_win_total == 3
    puts("You won 3 times! You are the grand winner.")
  end

  if computer_win_total == 3
    puts("The computer won 3 times :\( The computer is the grand winner.")
  end

  break if player_win_total == 3 || computer_win_total == 3

  user_choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(user_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{user_choice}; Computer chose: #{computer_choice}")
  display_results(user_choice, computer_choice)

  player_win_total = count_player_wins(user_choice, computer_choice, player_win_total)
  computer_win_total = count_computer_wins(computer_choice, user_choice, computer_win_total)
  puts "your win total: #{player_win_total}"
  puts "computer win total: #{computer_win_total}"
end

prompt("Thank you for playing! Goodbye.")
