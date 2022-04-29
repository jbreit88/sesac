# SESAC Coding Challenges

## Table of Contents
- <a href="#project-description">Project Description</a>
- <a href="#versions-and-dependencies">Versions and Dependencies</a>
- <a href="#installation-guide">Installation Guide</a>
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
7. Navigate into the desired project folder (`$ cd bot_saves_princess` or `$cd bot_saves_princess_2`) and run the RSpec test suite locally with the command `$ rspec` to ensure everything is functioning as expected.

----------

## Bot Saves Princess 1

A description of the problem can be found [here](https://www.hackerrank.com/challenges/saveprincess) or in the `bot_save_princess_task.md`.

*The `bot_save_princess_planning_notes.md` file contains my brainstroming notes if you would like to see my thoguht process for developing the solution.*

### Running the File:

1. From the `bot_saves_princess` directory run `$ ruby ./lib/runner.rb` to start the program.
  - The user is met with a prompt to input information: 
  
  ```
  "Please input a whole, odd number greater than 3 and less than 100 for a grid size." 
  ```
  
  - Error handling in place takes in the user input and if it is not an integer, or not an odd number between 2 and 100, the user is asked to repeat the action until a valid input is achieved.

2. Upon success input of a grid size, the user is asked to input their grid one row at a time. 

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

