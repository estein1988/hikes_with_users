# Happy Trails USA!

Your one-stop shop to find your favorite hike in the grand ole' USA!

## General Info

Happy Trails USA is a CLI application that allows users to select which state they are in, view available hiking options with their state, access reviews for their hike selections and leave a review after they went on the hike. 

### Walk-through Video
https://www.youtube.com/watch?v=hggjgbgYmqQ&feature=youtu.be

### Technologies
* Ruby - version 2.6.1
* ActiveRecord - version 6.0
* Sinatra-activerecord - version 2.0
* Rake - version 13.0
* SQLite 3 - version 1.4

### Setup

To run Happy Trails USA, install it locally by cloning this GitHub repository and run:
```
bundle install
rake db:migrate
rake db:seed
ruby runner.rb
```

### Code Examples
```
def state_selection
  system `say "Hello #{@user}, it is nice that you are getting outside to go hiking"` 
  prompt = TTY::Prompt.new
  @answer = prompt.select("What state are you hiking in?\n\n ".green.italic) do |menu|
    menu.choice 'Arizona'
    menu.choice 'Colorado'
    menu.choice 'New Mexico'
    menu.choice 'Utah'
    menu.choice 'Exit'
end

def trail_review(trail)
  reviews = Review.all.select do |review_instance|
    review_instance.trail == trail
  end
  reviews.map do |review|
    puts review.review
  end    
end

def options 
  prompt = TTY::Prompt.new 
  trails_in_state = Trail.by_state(@answer)
  trail_answer = prompt.select("Okay, here are some trail options, press enter to pick a trail:\n\n ", trails_in_state)
  list_trails(trail_answer)
end       
```
### Features
* App greets user with their name
* User can select which state they are in
* Based on state selection, user see available hike options in their state
* After selecting a hike, trail information and trail ratings are given
* User can either view reviews for that hike or pick a different hike
* After reading the reviews, the user is asked if they want to leave a new review
* If user leaves a new review, their basic information is asked to be provided and they can enter their comments and a rating
* User is given final option to delete their review, return to trail selections, or exit and go hiking!
* Most menu options allow the user to exit the app if they wish

_Additional Options for Features_
* Include APIs for trails around all of the U.S.
* Integrate user's review entries to Review class, migration table and schema
* Add photos for hikes or allow the user to upload their own photos from the hike
* Code can always be refactored!

### Status
App is fully functioning with option to grow with additional features

### Contact
Created by **[Elliott Stein](https://www.linkedin.com/in/steinelliott/)** and **[Sanjeev Yogi](https://www.linkedin.com/in/sanjeevyogi/)**
Please feel free to contact us!! 

