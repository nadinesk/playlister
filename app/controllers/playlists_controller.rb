class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new 
    @playlist = Playlist.new
    @tvshow = Tvshow.new
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

  private 

  
  def playlist_params
   params.require(:playlist).permit(tvshows_attributes: [:id, :title, :suspense_level, :time_commitment])

  end
end
