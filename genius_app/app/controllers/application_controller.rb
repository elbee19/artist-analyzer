class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def halwa
  	puts "lol------------2"
  end

  def artist_info
    @lol = [2,3,4]
  	puts params
  	artist = params[:artist]
  	songs_by_artist = RapGenius.search_by_artist(artist)
  	@song_ids = songs_by_artist.map { |x| x.id }
    respond_to do |format|
      format.html {render :json => @song_ids}
      format.js {}
    end
  	
  end
end
