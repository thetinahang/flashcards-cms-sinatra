# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app | Used Sinatra, gem in Gemfile
- [X] Use ActiveRecord for storing information in a database | Used AR, gem in Gemfile
- [X] Include more than one model class (list of model class names e.g. User, Post, Category) | User, Stack, Flashcard
- [X] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts) | User has many stacks
- [X] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User) | Flashcard belongs to Stack
- [X] Include user accounts | Yes, see signup and login views
- [X] Ensure that users can't modify content created by other users | Users cannot see or edit others' stacks
- [X] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying | Stacks and flashcards have routes for all
- [X] Include user input validations | Yes, see User model
- [X] Display validation failures to user with error message (example form URL e.g. /posts/new) | redirect if not logged in 
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code | Yes..

Confirm
- [X] You have a large number of small Git commits | Yes..
- [X] Your commit messages are meaningful | Yes.. 
- [X] You made the changes in a commit that relate to the commit message | Yes..
- [X] You don't include changes in a commit that aren't related to the commit message | Yes.. 
