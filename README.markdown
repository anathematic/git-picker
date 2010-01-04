# Git Picker
An easy way to import your git resposities and export the logs.

## Getting started
I'm using postgres however it should work under SQLite or the database of your flavour 

  `git clone git://github.com/anathematic/git-picker.git
  cd git-picker
  mv config/database.yml.sample config.database.yml
  rake db:create && rake db:migrate
  ruby script/server`
  
Then head over to 

  `http://localhost:3000`
  
And you should be good to go.

## Requirements
When I initially wrote this I was on Rails 2.3.4 - it should work on most other major versions from 2.1+ 

  `sudo rake gems:install
  sudo rake gems:install RAILS_ENV="cucumber"`
  
## Testing
The whole thing is pretty well tested with a combination of Cucumber and rSpec, I will probably go through and add more testing for the csv / export features later down the track.

To run through the tests there's a combination of:

  `cucumber features/
  spec spec/models`
  
## Wishlist
There's a few things this is really missing, here's what's in my head for later on:
- Live URL reading, none of this needing to zip up git repos stuff
- Better interface, bloops I should really get around to do
- Better exports based on dates / branches / different formats

That's it, any bugs you can find me as @anathematic on twitter or contact via github.