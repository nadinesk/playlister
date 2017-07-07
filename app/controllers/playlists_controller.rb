class PlaylistsController < ApplicationController

  def index
  end
  
  def show
    @playlist = Playlist.find(params[:id])
  end

  def submit
    playlist = Playlist.find params[:id]
    playlist.submit
    redirect_to playlist_path(playlist)
  end
end
