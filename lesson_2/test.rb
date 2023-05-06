valid_choices = %w[rock paper scissors lizard spock]
player_win_total = 0
computer_win_total = 0

def prompt(message)
  puts("=> #{message}")
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
    prompt('You won!')
  elsif win?(computer, player)
    prompt('Computer won!')
  else
    prompt("It's a tie!")
  end
end

def count_player_wins(player, computer, player_win_total)
  if win?(player, computer)
    puts "Player win total before increment: #{player_win_total}"
    player_win_total += 1
    puts "Player win total after increment: #{player_win_total}"
  end
  player_win_total
end

def count_computer_wins(computer, player, computer_win_total)
  if win?(computer, player)
    computer_win_total += 1
  end
  computer_win_total
end

loop do # MAIN LOOP
  if player_win_total == 3
    puts('You won 3 times! You are the grand winner against the computer.')
  end

  if computer_win_total == 3
    puts('The computer won 3 times :\( The computer is the grand winner.')
  end

  break if player_win_total == 3 || computer_win_total == 3

  user_choice = ''
  loop do
    prompt("Choose one: #{valid_choices.join(', ')}")
    user_choice = gets.chomp

    if valid_choices.include?(user_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = valid_choices.sample
  puts "You chose: #{user_choice}; Computer chose: #{computer_choice}"

  display_results(user_choice, computer_choice)
  player_win_total = count_player_wins(user_choice, computer_choice, player_win_total)
  computer_win_total = count_computer_wins(computer_choice, user_choice, computer_win_total)

  puts "Your win total: #{player_win_total}"
  puts "Computer win total: #{computer_win_total}"
end

prompt('Thank you for playing! Goodbye.')
