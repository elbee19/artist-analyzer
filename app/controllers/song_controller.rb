
class SongController < ApplicationController

	def show
		song_id = params[:id]
		rg_song = RapGenius::Song.find(song_id)
		full_lyrics = get_full_lyrics(rg_song)
		song = Song.new(rg_song.title,full_lyrics,rg_song.media,rg_song.description,rg_song.url)
		render :json => song
	end

	def get_full_lyrics(rg_song)
		full_lyrics = rg_song.lines.map{|x| x.lyric}.join
	end

end