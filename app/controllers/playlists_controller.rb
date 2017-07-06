class PlaylistsController < ApplicationController

  def show
    @playlist = Playlist.find(params[:id])
  end

  def submit
    playlist = Playlist.find params[:id]
    playlist.submit
    redirect_to playlist_path(playlist)
  end
end
