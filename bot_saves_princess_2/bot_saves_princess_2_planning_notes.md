Return value needs to be `next_move`, not the entirety of the path.

In the example input it says the princess and bot are 'randomly' set, but the user passes in parameters to set the princess and the bot.
 - They pass in bot and princess coordinates indirectly by passing in the grid string.
 - This makes passing in the bot coordinates redundant because you basically say where the bot is and then place the bot.
 - There is nothing random about this, so I am making the assumption that 'random' in this context means the bot and princess can be placed anywhere on the board, but those locations are still set by the user.

I will build this version out taking the input literally. The user must input a grid size, the coordinates of the bot, and the grid string.
 - I should check that the grid coordinates input by the user match those of the bot in the grid string.
 - I should check that princess coords and bot coords are not the same in user input or on the board.

I'll reuse the logic for moving the bot from problem 1. Using the bot coordinates and the princess coordinates I can move the bot closer and closer by looking at the difference between the x and y values. When the values are equal, the bot has arrived at the princess.

The next_move function needs to only return the bot's next move. It does not need to keep track of past moves.
 - But, if we built in a move_history attribute on the bot, then as the bot moves, we could shovel the moves into the history and if we wanted to print out the total movement history we could.
 - Maybe I could build out a second version of the problem that places the bot and princess randomly based on a grid size that the user inputs. Then could let the user Y/n their way through the bot's movement by saying "Would you like to see the bot's next move." If Y loop the next move function, if n, exit the program.

Need to do:
  - Move code from problem one to problem 2
    - User input
    - grid_to_matrix
    - make_grid
    - find_bot
    - find_princess
  - New Code
    - Check bot and princess are not same spot
    - check bot coords are the same as where it is in grid string
    - use same movement logic from bot-save-princess-1, but only print one movement instead of entire thing.
