The game is set up on a grid.

Bot is in the center and princess is in a corner.
- Since the bot is always in the same position and the princess is in one of four predictable positions, we could easily write if..else for 4 patterns.

IE: in a 3x3 grid, we know bot coords = [2,2], and we can assume princess will equal one of 4 options ([0,0], [3,0], [0,3], [3,3]).

We could simply return Left\n UP\n if we know the princess is at [0,0]. However, this doesn't scale dynamically with the grid size.

We know that the grid must always be a square, and since the corners will always be (grid_size - 1) / 2 away, we know that for 3x3 if the princess is in [0,0] we need to move diagonally once ([3 - 1] / 2 = 1), which would be [UP, LEFT] x 1. But if the grid size is increased to 5x5 we need to move diagonally twice ([5 - 1] / 2 = 2). So we would need to repeat the UP, LEFT motion 2 times to arrive at the [0,0] corner.

So once we have determined which corner the princess is in, we can repeat the action to move towards the corner a number of times mathematically dictated by the grid size.

Find princess
2a. If [0,0] bot_movement << [LEFT, UP] (grid size - 1) / 2 number of times
2b. If [0,3] bot_movement << [RIGHT, UP] (grid size - 1) / 2 number of times
2c. If [3,0] bot_movement << [LEFT, DOWN] (grid size - 1) / 2 number of times
2d. If [3,3] bot_movement << [RIGHT, DOWN] (grid_size - 1) / 2 number of times

This solution scales with the grid size, takes into account the princess position being at one of four possible locations, and assumes the bot is always in the center square, and assumes a odd# x odd# grid. For a 5x5 grid with the bot in the center and the princess at [0,0], the output would look something like:

```
LEFT
UP
LEFT
UP
```

Using the same assumptions as above we could do something like this:

1. Find princess
2a. If [0,0] bot moves (grid size - 1) / 2 LEFT and (grid size - 1) / 2 UP
2b. If [0,3] bot moves (grid size - 1) / 2 RIGHT and (grid size - 1) / 2 UP
2c. If [3,0] bot moves (grid size - 1) / 2 LEFT and (grid size - 1) / 2 DOWN
2d. If [3,3] bot moves (grid size - 1) / 2 RIGHT and (grid size - 1) / 2 DOWN

This would basically mimic the bot moving all the way to an edge, then all the way to the appropriate corner. For a 5x5 grid with the bot in the center and the princess at [0,0], the output would look something like:

```
LEFT
LEFT
UP
UP
```

Both of these solutions I think generate the appropriate results. But do not take into account a misplaced princess or a misplaced bot. Granted I could implement some error handling that prevents someone from placing a bot not in the middle, or I could check that the princess is in a corner, and if not return an error. But I think I can use their coordinates to plan the movement of the bot.

We have 4 values, the bot x coordinate, the bot y coordinate, and an x and a y coordinate for the princess. If the bot is in the middle of a 3x3 grid it is at [2,2]. If the princess is in the top left she is at [0,0]. I can loop over these coordinates and generate the bot's movement iteratively.  

1. Is bot x value equal to princess y value? If not, compare them and generate a movement while increasing or decreasing the bot x value.

IE: Bot [2,2], Princess[0,0]. bot_x < princess_x, so we know bot needs to move LEFT. bot_movement << LEFT and decrease bot_x by 1. Now bot [1,2] and princess [0,0]. We need to move left again, repeat the bot movement and adjust the bot's coordinates. Now bot[0,2] and princess[0,0]. The x values are aligned, so we know we are in the right column, now we need to move vertically. The princess' y = 0 is < bot y = 2, so the bot must move upwards. bot_movement << UP, decrese bot_y by 1. Now, bot [0,1] and princess [0,0]. Iterate one more time to put the bot in the same square, and we end up with an bot movement array like [LEFT, LEFT, UP, UP], which can be made into:

```
LEFT
LEFT
UP
UP
```

That feels like the move dynamic solution to me because you could expand the game to put the bot anywhere and it would still work. Even though for now, we are hard coding the bot and princess locations.

Things I Need:
1. Bot (must be placed in board center)
  - x_coord
  - y_coord
2. Princess (must be placed in board corner)
  - x_coord
  - y_coord
3. Grid
  - grid_size (must be odd number)
  - Actual grid
4. Generate path from bot coords to princess coords
