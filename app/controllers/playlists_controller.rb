class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end
  
  def show
    @playlist = Playlist.find(params[:id])
  end

  def submit
    
    playlist = Playlist.find(params[:id])
    playlist.change_attributes
    playlist.submit_list
    redirect_to playlist_path(playlist)
  end
end
