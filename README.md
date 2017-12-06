The branch that contains the artifacts and documentation is [project4_doc.](https://github.com/Git-Schwifty-448/Soundit-/tree/project4_doc)

![Soundit!](/app/assets/images/logo.png)

# SoundIt! ( Project 4 Submission )

Do you find that media player search algorithms always are suggesting the same songs and take
the human experience out of music? Soundit! attempts to solve this problem by blatently ripping 
off the -it experience and combining it with the ability to generate playlists out of the songs
you "like", exporting them to Spotify and otherwise allowing you and your friends a more social, 
personal music experience.

## About
Soundit! was built using for EECS 448 at the University of Kansas and uses the Rails framework. It works with either a postgresql or sqlite3 database.

## Testing
* Navigate to the repo in the terminal
* `rails test --verbose` will run the automatic testing suite
* Note* To see test files look through .rb files in /test

## Deployment
* Clone from Github
* Navigate to the repo in the terminal
    * Be sure to use Ruby 2.4.1 or newer
* `bundle install`
* `rails server`
* Visit the site here: [localhost:3000](http://localhost:3000)
* An example database has been populated and supplied on the master branch
    * Admin account uname: admin@admin.com pass: admin123
    * User account: uname: user@user.com pass: user123


### Functionality
* Users can post links to songs
    * Posts can be upvoted and downvoted with score tracking
    * Users can comment on posts and comments creating subdiscussions within song postings
* Each song belongs to a user-created community of similar genre songs
    * Users can subscribe to communities
* Posts, comments, communities can be moderated by Admins 
    * Fully featured admin console ensures unwanted content can be removed quickly
* Global Frontpage playlist can be created and added to by users via posted songs
* Frontpage Spotify playlist and youtube playlists allow quick and convenient listening
    * Users can create spotify playlists out of communities
    * Users can create spotify playlists out of their own site-created playlists

### Notes
* Styling based on Google Material Design
* Fully native mobile and web experience

( The main goal was to roll our own whenever we can and avoid using gems )

### Sources
* Post model adapted from [Rails Guides](http://guides.rubyonrails.org/)
* Users and sessions adapted from [Ruby on Rails Tutorial](https://www.railstutorial.org/)
* Polymorphic comments adapted from [Go Rails](https://www.youtube.com/watch?v=fzz62HWGNNA)
* [Materialize CSS](http://materializecss.com)