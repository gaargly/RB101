# what are we doing here?

we set up a bunch of methods we need to use

we set the player_win_total & the computer_win_total variables to 0
IMPORTANT INSIGHT: at this point, these two variables will always be 0

we have a big loop, the # MAIN LOOP
  if the player_win_total or the computer_win total == 3, we print a message to the user
  if the player_win_total or the computer_win total == 3, we BREAK out of the bloop
  we initialize a user_choice variable
  we have a loop (this is simply ask user & validate user_choice loop)
    - prompt the user to choose
    - set the user_choice variable to store the player's choice
    - validate the user_choice

  the computer chooses & we store it in computer_choice
  display user_choice & computer_choice
  display results (who won)
  increment number of user wins or computer wins, depending on who won
end # MAIN LOOP
