class PlaylistsController < ApplicationController

  def index
  end
  
  def show
    @playlist = Playlist.find(params[:id])
  end

  def submit
    binding.pry
    playlist = Playlist.find(params[:id])
    playlist.submit_list
    redirect_to playlist_path(playlist)
  end
end
