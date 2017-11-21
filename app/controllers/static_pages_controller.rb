require 'rspotify'

class StaticPagesController < ApplicationController
  def home
    
    if logged_in?
      @microposts = current_user.microposts.paginate(page: params[:page])
      @posts = current_user.microposts.limit(5)
    end

    @feed = Micropost.paginate(page: params[:page], :per_page => 7)
    @community_listings = Community.all.limit(3)
    @playlists = Playlist.all.limit(7)

  end

  def help
  end

  def about
  end

  def spotify

  end

  def spotify_helper
  # end

  # def front_spotify
  @songs = Micropost.all.limit(50)
  
      ## Do not store this on github!!!
      RSpotify.authenticate("7eaf81c8e2384e0f9b021058e3141882", "ed91711edce944549f3041499433f016")
    
  
      spotify_user = RSpotify::User.find('1224459409')
  
      
  
  
      @playlist = RSpotify::Playlist.find('1224459409','5EAbXQCZMXMLIsqKdKR25f')
      @total = @playlist.total
  
  
      @tracks_to_add = []
  
  
      for song in @songs
        @tracks = RSpotify::Track.search(song.title)
  
        for track in @tracks
          if track.artists.first.name == song.artist
            @tracks_to_add.push(track)
            break
          end
        end
        
      end
  
      @playlist.replace_tracks!(@tracks_to_add)

      redirect_to spotify_path
  end
end
