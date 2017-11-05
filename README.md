Note* /rdoc is generated documentation code, /doc is sprint backlog, etc.

![Soundit!](/app/assets/images/logo.png)

# ( Project 3 )

Do you find that media player search algorithms always are suggesting the same songs and take
the human experience out of music? Soundit! attempts to solve this problem by blatently ripping 
off the -it experience and combining it with the ability to generate playlists out of the songs
you "like". 

## About
Soundit! was built using the rails framework and works with either a postgresql or sqlite3 database.

## Deployment
* Download from Github
* Navigate to the repo in the terminal
    * Be sure to use Ruby 2.4.1 or newer
* `bundle install`
* `rails server`
* An example database has been populated and supplied on the master branch
    * Admin account uname: admin pass: admin123
    * User account: uname: user pass: user123

## Project 3 Features

### Functionality
* Ability to register/reset password and user session control
* Users can post links to songs
* Posts can be upvoted and downvoted with score tracking
* Posts can be moderated if the user is an admin
    * Admin status must be set by modifying the database ( Will be fixed for proj. 4 )
* Global playlists can be created and added to by users

### Models
* Custom user model
* Custom user sessions model
* Custom post model
* Custom playlist model

### Notes
* Styling based on Google Material Design
* Fully native mobile and web experience ( mobile in progress )

( The main goal was to roll our own whenever we can and avoid using gems )

### Sources
* Post model adapted from [Rails Guides](http://guides.rubyonrails.org/)
* Users and sessions adapted from [Ruby on Rails Tutorial](https://www.railstutorial.org/)

## Project 4 ( Proposed additions )
* Playlists are assigned to users, and users keep unique playlists
    * Groups of users all having modify access to to shared playlist
* **Ability to export playlists into Spotify playlists**
* Media player able to handle songs from links other than youtube
* **Nested comments**
* Fully mobile design
* More...

