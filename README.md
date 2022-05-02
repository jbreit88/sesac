# SESAC Coding Challenges

## Table of Contents
- <a href="#project-description">Project Description</a>
- <a href="#versions-and-dependencies">Versions and Dependencies</a>
- <a href="#installation-guide">Installation Guide</a>
- <a href="#bot-saves-princess">Bot Saves Princess</a>
- <a href="#bot-saves-princess-1">Bot Saves Princess I</a>
- <a href="#bot-saves-princess-2">Bot Saves Princess II</a>

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
7. Navigate into the desired project folder (`$ cd bot_saves_princess`, `$ cd bot_saves_princess_1` or `$cd bot_saves_princess_2`) and run the RSpec test suite locally with the command `$ rspec` to ensure everything is functioning as expected. Detailed explanations for the different project folders can be found below. 

----------

## Bot Saves Princess

*The `/documentation` directory contains explanations of the two "Bot Saves Princess" tasks, as well as my brainstorming notes for both tasks if you would like to follow my thought process.*

The `/bot_saves_princess` project folder contains my solutions to both "Bot Saves Princess" problems. I refactored my code from the previous solutions (which can be found in the `bot_saves_princess_1` and `bot_saves_princess_2` folders respectively) for a number of reasons, and the refactor comes with some drawbacks.

### Reasons for Refactor:

1. I wanted to be sure my code was set up in a way that it would run smoothly and correctly on the HackerRank website.
2. After re-reading the instructions, I felt like there was a possibility that my previous solutions would be seen as doing too much, so I decided to scale back and focus on building a solution that output exactly what the problem asked for.
3. Readability: I feel like it is much easier to follow what is happening with the code within my refactor.

### Drawbacks:

1. This solution has no error handling. My previous solutions to problems #1 and #2 implemented error handling that achieve the following:
 - Check that princess was correctly placed in a corner (Problem #1)
 - Check that the bot was correctly placed in the center (Problem #1)
 - User input grid size was a valid input (Problem #1 and #2)
 - User input grid was valid (I.E. had the correct number of characters to make the board, had only one princess, had only one bot, had no extraneous characters (Problem #1 and #2)
 - Check that user input bot coordinates match where bot is placed on the board (Problem #2)
2. The above error handling was done by checking user input and rerunning sections of code until the user provided valid input. Without a test suite designed to change input after providing invalid input, I feared my code would cause the automated tests to fail. In doing away with this error handling, I am making a number of assumptions. Some of those assumptions are:
 - The grid size will be a valid integer: odd, 2 < n < 100 (Problem #1) or 2 <= n < 100 (Problem #2)
 - The grid a user inputs will have the bot placed correctly in the center of the board. (Problem #1)
 - The princess will be placed in a corner. (Problem #1)
 - The princess will not be placed on the coordinates defined as being the location of the bot. (Problem #2)
 - The correct number of '-' will be input by the user. (Problem #1 and #2)
 - The user knows what is to be input and when, so I have not printed anything to the terminal to indicate what the user should be doing. (Problem #1 and #2)

With all that being said, below are instruction for running the code and the files required to run the code on the HackerRank website.

### Running the Code: `displayPathtoPrincess`

1. Navigate to the project directory: `$ cd ./bot_saves_princess`
2. Initiate the runner file: `$ ruby ./display_path_to_princess_runner.rb`
3. Input a grid size.
4. Input a valid grid layout.
5. The program will output the path the bot must take to get to the princess.

<details>
  <summary>Example</summary>

  ![path_to_princess](https://user-images.githubusercontent.com/88853324/166185362-8c95899c-4887-436d-8c0a-49b85b69c655.gif)

</details>

- In order to run the code on HackerRank, you will need to copy and paste the code from the `display_path_to_princess_runner.rb` to the text editor. In order to run this file requires the required files at the top of the file, all of which can be found in the `./bot_saves_princess/lib` directory.

### Running the Code: `nextMove`

1. Navigate to the project directory: `$ cd ./bot_saves_princess`.
2. Initiate the runner file: `$ ruby ./display_next_move_runner.rb`.
3. Input a grid size.
4. Input bot coordinates in the format as follows: `0 3`.
5. Input a valid grid layout.
6. The program will output the the next move the bot must make to get to the princess.

<details>
  <summary>Example</summary>

  ![display_next_move](https://user-images.githubusercontent.com/88853324/166185819-3ee2c73d-51cf-44e6-9f19-d18c5ea04e99.gif)

</details>

- In order to run the code on HackerRank, you will need to copy and paste the code from the `display_path_to_princess_runner.rb` to the text editor. In order to run this file requires the required files at the top of the file, all of which can be found in the `./bot_saves_princess/lib` directory.

----------

## Bot Saves Princess 1

<details>
  
  <summary>Previous Solution Details</summary>

  A description of the problem can be found [here](https://www.hackerrank.com/challenges/saveprincess) or in the `bot_saves_princess_task.md`.

  *The `bot_saves_princess_1_planning_notes.md` file contains my brainstroming notes if you would like to see my thoguht process for developing the solution.*

  ### Running the File:

  1. From the `bot_saves_princess_1` directory run `$ ruby ./lib/runner.rb` to start the program.
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
  - Error handling in place checks that the grid size is correct, that there is only one princess and she has been appropriately placed in a corner, that there is only one bot and it has been appropriately placed in the center, and that no characters besides the princess('p'), the bot('m'), and empty space ('-') have been used. 

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
  
</details>

----------

## Bot Saves Princess 2

<details>
  
  <summary>Previous Solution Details</summary>

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
  - Error handling in place checks that the grid size is correct, that there is only one princess and she has been appropriately placed in a corner, that there is only one bot and it has been appropriately placed in the center, and that no characters besides the princess('p'), the bot('m'), and empty space ('-') have been used. 

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
  
</details>

----------

## Built By

Please feel free to checkout my profiles:
<ul>
  <li><a href="https://github.com/jbreit88">GitHub Profile</a></li>
  <li><a href="https://www.linkedin.com/in/jbradfordbreiten/">LinkedIn</a></li>
  <li><a href="https://jbreit88.github.io/resume/">Resume</a></li>
  <li><a href="https://terminal.turing.edu/profiles/1235">Terminal Profile</a></li>
</ul>
