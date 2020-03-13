# STURDY CARDS

- [STURDY CARDS](#sturdy-cards)
  - [About](#about)
      - [Research and Problem statement](#research-and-problem-statement)
  - [Features](#features)
  - [Next Steps](#next-steps)
  - [Tutorial](#tutorial)
  - [UML Diagram](#uml-diagram)
  - [Project Timeline](#project-timeline)
  - [Github](#github)


## About


Sturdy cards is flash cards with spaced repetition learning feature. It is created for anyone who wants to reinforce their learning through spaced repetition.

The concept is simple.

1. You will be given a few default decks to get a feel of how the application works. 
2. You can create custom decks and cards within the decks. 
3. You can export decks as csv files to share information with friends/families, or create new decks by importing csv files
4. Once you are all set up, you can start learning. There are a few different modes available for you so you will never get bored of being tested by the same method throughout the process.
5. Lastly, sit back and be sturdy. Your knowledge will only ever going to get sturdier.



* There is a [tutorial](##Tutorial) section below if you need further instructions on how to use the application.
* Feel free to read through the [feature section](##Features) to understand how our feature works.



#### Research and Problem statement 

From my learning experience and my observation with how humans learn, we humans learn and retain better through continuous repetition. As quoted from Tony Robbins,

> Repetitions is a mother of skill
> - Tony Robbins

**"Many students find it difficult to memorise information even though the information has been processed and understood. More often than not, subject contents delivered in a traditional method, do not provide students with the time and reinforcement tool to excel in mastering those content."**

With Sturdy Cards, you can be rest assured your learning will be taken care of. By using spaced repetition and several distinctive modes available to choose from, we can help you learn and retain information more effectively. For those who are already at an advanced level in a subject, your subject expertise can be further reinforced. 

## Features

|   Features    |              Functions                                 |        Released Date                     |
|:----------------- | :--------------------------------------------------------: | :---------------------------------: |
|1. Decks | Allows deck viewing, creation, updating and deletion | 14-March-2020 |
|2. Cards | Allows card viewing, creation, updating and deletion |         14-March-2020 |
|3. Learning Mode | Users are given a few different modes to learn |         14-March-2020 - Present |

## Next Steps

1. More learning modes - TBA
2. Learning Progress - implement a tracking feature every time the users attempt the learning mode
3. Export/Import of csv files as decks and cards
4. Notifications - daily question auto-prompt
5. Community and Friends - allow information to be published publicly in the app and follow friends
6. Ranking system
7. Competitions

## Tutorial

The app runs on terminal command-line. 

CSV files are used to keep the data created/altered from the command-line.

Notes:
  * Most deck search functionality uses id unless stated otherwise by the program. 
  * Card search functionality uses card_name
  * Errors like duplicates, names and non-existent data are captured

The first menu you will encounter is the *Main Menu*
* Select one of the options (select 1 as Learning Mode is in progress)
* The next stop is *Deck Menu*. 
  * Select one of the options (View, Create, Update and etc) 
  *  In View Deck, you will be asked to select a deck id. (The program will catch the error if id does not exist and asks for your input again)
  *  In Create Deck, you will be asked *name* and *topic* of the deck you want to create (If name already exists, you will need to enter another name)
  *  In Update Deck, the information presented is the same as View Deck. Once a deck is selected for update, it will update the csv file.
  *  In Delete Deck, select a deck to be removed (csv will update). If deck does not exist, it will prompt you to enter a valid id.


## UML Diagram 

![UML Diagram](./Desktop/../../../resources/UML&#32;Sturdy&#32;Cards.png)


## Project Timeline 

[Sturdy Cards - Trello](https://trello.com/b/crD1QQab/sturdycards-terminal-app)

## Github 

[codebender16-git-hub](https://github.com/codebender16/noname)

How to install

You must include:
- steps to install the application
- any dependencies required by the application to operate
- any system/hardware requirements