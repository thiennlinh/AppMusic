require 'rspotify'

class StaticPagesController < ApplicationController
  def home
    
    if logged_in?
      @microposts = current_user.microposts.paginate(page: params[:page])
      @posts = current_user.microposts
    end

    @feed = Micropost.paginate(page: params[:page], :per_page => 7)
    
    #  Make sure to only collect 3 records using whatever method!
    @community_listings = []
    @community_names = []
    for id in 2..4
      @community_names.append(Community.where(id: id).select(:title, :id))
      @community_listings.push(Micropost.where(community_id: id).limit(3))
    end

    @communities = Community.all.limit(7)
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
