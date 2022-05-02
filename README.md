# SESAC Coding Challenges

## Table of Contents
- <a href="#project-description">Project Description</a>
- <a href="#versions-and-dependencies">Versions and Dependencies</a>
- <a href="#installation-guide">Installation Guide</a>
- <a href="#bot-saves-princess-1">Bot Saves Princess I</a>
- <a href="#bot-saves-princess-2">Bot Saves Princess II</a>
- <a href="#unused-code">Unused Code</a>

----------

## Project Description

This project contains my solutions to the HackerRank ['Bot Saves Princess'](https://www.hackerrank.com/challenges/saveprincess) and ['Bot Saves Princess 2'](https://www.hackerrank.com/challenges/saveprincess2) coding challenges. The user interfaces with the files through their terminal and I have implemented error handling to ensure correct user input throughout. Directions for installing and running the files can be found below.

----------

## Versions and Dependencies

- Ruby 2.7.2

- [pry 0.14.1](https://github.com/pry/pry)
- [rspec 3.11.0](https://github.com/rspec/rspec-metagem)

*Ruby version and dependencies are specified in the Gemfile.lock*

----------

## Installation Guide

On your local system, open a terminal session to run the following commands:
1. Clone this repository `$ git clone git@github.com:jbreit88/sesac.git`
2. Navigate to the newly cloned directory `$ cd sesac`
3. If Ruby v2.7.4 is not installed follow the instructions [here](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos)
  - You need only follow the instructions through installing Ruby. Be sure to specify the requisite version number and set that to your global version.
4. If bundler is not installed run `$ gem install bundler`
5. If or after bundler is installed run `$ bundle install` to install the required Gems
6. If errors occur, check for proper installation and versions of `bundler` and `ruby`
7. Navigate into the desired project folder (`$ cd bot_saves_princess` or `$cd bot_saves_princess_2`) and run the RSpec test suite locally with the command `$ rspec` to ensure everything is functioning as expected.

----------

## Bot Saves Princess 1

A description of the problem can be found [here](https://www.hackerrank.com/challenges/saveprincess) or in the `bot_saves_princess_task.md`.

*The `bot_saves_princess_planning_notes.md` file contains my brainstroming notes if you would like to see my thoguht process for developing the solution.*

### Running the File:

1. From the `bot_saves_princess` directory run `$ ruby ./lib/runner.rb` to start the program.
  - The user is met with a prompt to input information: 
  
  ```
  "Please input a whole, odd number greater than 3 and less than 100 for a grid size." 
  ```
  
  - Error handling in place takes in the user input and if it is not an integer, or not an odd number between 2 and 100, the user is asked to repeat the action until a valid input is achieved.

2. Upon successful input of a grid size, the user is asked to input their grid one row at a time. 

```
Please enter '-' for empty space, 'm' for the bot, and 'p' for princess.
Be sure your input matches your grid size.
Row number 1 of 3:
```

  - The number of rows required scales with the user grid size input.
  - Error handling in place checks that the grid size is correct, that there is only one princess and she has been appropriately placed in a corner, that there is only one bot and it has been appropriately placed in the center, and that not characters besides the princess('p'), the bot('m'), and empty space ('-') ahve been used. 

3. Once the user has provided a valid grid size and grid setup, the program finds the position of the bot, the position of the princess, and maneuvers the bot through to the princess in the fewest moves possible, then prints the path taken one step at a time in the terminal.

```
Please input a whole, odd number greater than 3 and less than 100 for a grid size.
3
Please enter '-' for empty space, 'm' for the bot, and 'p' for princess.
Be sure your input matches your grid size.
Row number 1 of 3:
---
Row number 2 of 3:
-m-
Row number 3 of 3:
p--
Path to Princess:
DOWN
LEFT
```

<details>
  <summary>Application Example GIF</summary>

  ![ezgif-4-b2a6ea5832](https://user-images.githubusercontent.com/88853324/166065436-9bec91f2-f9dd-4a59-a9ca-38dfffb4b57a.gif)

</details>

----------

## Bot Saves Princess 2

A description of the problem can be found [here](https://www.hackerrank.com/challenges/saveprincess2) or in the `bot_saves_princess_2_task.md`.

*The `bot_saves_princess_2_planning_notes.md` file contains my brainstroming notes if you would like to see my thoguht process for developing the solution.*

### Running the File:

1. From the `bot_saves_princess_2` directory run `$ ruby ./lib/runner.rb` to start the program.
  - The user is met with a prompt to input information (different than the above solution because the requirements for a valid grid are different): 
  
  ```
  "Please input a whole number greater than 1 and less than 100 for a grid size." 
  ```
  
  - Error handling in place takes in the user input and if it is not an integer between 1 and 100, the user is asked to repeat the action until a valid input is achieved.

2. Upon successful input of a grid size, the user is asked to input their desired coordinates for their bot: 

```
Please enter the row coordinate for the bot.
0
Please enter the column coordinate for the bot.
1
```
 - The bot coordinates must be entered as integers from 0 to one less than the grid size. This ensures that the bot can be placed by an index coordinate somewhere on the board. The above input will render bot coordinates of `[0,1]`

3. After inputting the bot's coordinates, the user is prompted to input their grid configuration one row at a time:

```
Please enter '-' for empty space, 'm' for the bot, and 'p' for princess.
Be sure your input matches your grid size.
Row number 1 of 3:
```

  - The number of rows required scales with the user grid size input.
  - Error handling in place checks that the grid size is correct, that there is only one princess and she has been appropriately placed in a corner, that there is only one bot and it has been appropriately placed in the center, and that not characters besides the princess('p'), the bot('m'), and empty space ('-') ahve been used. 

4. Once the user has provided a valid grid size and grid setup, the program uses the position of the bot and the position of the princess to maneuver the bot towards the princess pne move at a time. The user is prompted is they want to see the bot's next move. The user can select `y` for 'Yes' or `n` for 'No'. Yes leads the terminal to print out the bot's next move and prompt the user again if they would like to see the next move. This continues until the user selects 'No' or the bot finds the princess. The final output to the terminal is the entire movement history of the bot in its journey to find the princess:

```
Please input a whole number greater than 1 and less than 100 for a grid size.
3
Please enter the row coordinate for the bot.
0
Please enter the column coordinate for the bot.
1
Please enter '-' for empty space, 'm' for the bot, and 'p' for princess.
Be sure your input matches your grid size.
Row number 1 of 3:
-m-
Row number 2 of 3:
---
Row number 3 of 3:
--p
Would you like to see the bot's next move? Y/n:
y
DOWN
Would you like to see the bot's next move? Y/n:
y
DOWN
Would you like to see the bot's next move? Y/n:
y
RIGHT
The bot has found the princess.
Here is your bot's full move history:
DOWN
DOWN
RIGHT
```

<details>
  <summary>Application Example GIF: Yes Until Finish Path</summary>

  ![bot_princ_yes_only](https://user-images.githubusercontent.com/88853324/166169424-4ee9c0c9-1f2f-4bba-b42c-9907cb352f6a.gif)

</details>

 - If the user selects 'No' before the bot has found the princess, the journey is interupted and the bot's journey thus far is printed to the terminal:

```
Please input a whole number greater than 1 and less than 100 for a grid size.
3
Please enter the row coordinate for the bot.
0
Please enter the column coordinate for the bot.
1
Please enter '-' for empty space, 'm' for the bot, and 'p' for princess.
Be sure your input matches your grid size.
Row number 1 of 3:
-m-
Row number 2 of 3:
---
Row number 3 of 3:
--p
Would you like to see the bot's next move? Y/n:
y
DOWN
Would you like to see the bot's next move? Y/n:
n
Thank you for playing!
Here is your bot's full move history:
DOWN
```

<details>
  <summary>Application Example GIF: Break Path with No</summary>

  ![bot_princ_end_no](https://user-images.githubusercontent.com/88853324/166169523-f0910a6b-2abc-449a-8993-a63e97c98d83.gif)

</details>

----------

## Unused Code

As you look through my project, you will find a directory titled `unused_alternate_solution`. As I was working on `bot_saves_princess_1` I had thought to break out the parts of the code into four different classes: Path, Bot, Princess, Grid. By breaking these four pieces out individually I could alter and update their states more dynamically. The Princess class would have row and column coordinate value that would be unchanging. The bot would have a row and column coordinate value that could be updated (much like the bot used in my solution for `bot_saves_princess_2`). The Grid would take in the grid size and the user input grid string, render them as a matrix or 2d array, place the bot and the princess, and run all checks on whether everything is valid and placed correctly. Finally, the Path would be responsible for plotting out the path the bot takes to get to the princess, as well as updating the bot's coordinates and movement history.

There are many positives to setting the code up this way:
1. When asked to add a `nextMove` function for `bot_saves_princess_2`, the logic would have already been in place from generating the bot's path in the first problem, and so would have been easy to update.
2. By breaking everything into separate classes, we are better able to maintain SRP in our nextMove and pathToPrincess methods. Those methods in theory should only print the path to princess to the terminal, or print the next move to the terminal and update the relevant information, however, as it stands, nextMove takes in some extra user input and has three possible branches for resolving the function (user says yes and prints a new move, user says no and terminates the function, or the bot has found the princess and that is printed to the termianl).

Overall I feel like breaking things out into their separate classes would be a positive refactor for this project and given a little more time that would be my next move.

----------

## Built By

Please feel free to checkout my profiles:
<ul>
  <li><a href="https://github.com/jbreit88">GitHub Profile</a></li>
  <li><a href="https://www.linkedin.com/in/jbradfordbreiten/">LinkedIn</a></li>
  <li><a href="https://jbreit88.github.io/resume/">Resume</a></li>
  <li><a href="https://terminal.turing.edu/profiles/1235">Terminal Profile</a></li>
</ul>
