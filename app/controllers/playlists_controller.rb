class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end

  def new 
    @playlist = Playlist.new
    @tvshow = Tvshow.new
  end


#  def create
 #   current_user.create_current_playlist unless current_user.current_playlist
  #  tvshow = Tvshow.find_or_create_by(:title => params[:playlist][:tvshow][:title])
   # tvshow.suspense_level = params[:playlist][:tvshow][:suspense_level]
    #tvshow.time_commitment = params[:playlist][:tvshow][:time_commitment]
    #tvshow.save
    #binding.pry
    #showline_message = current_user.current_playlist.add_tvshow(tvshow.id)
    
    #if showline_message == ("successfully added tv show")
    #  showline = current_user.current_playlist.save_show(params[:tvshow_id])
    #  if showline.save
    #    redirect_to playlist_path(current_user.current_playlist), {notice: 'Tvshow added to playlist!'}
    #  else 
    #    redirect_to store_path, {notice: 'Unable to add tvshow'}
    #  end
    #else
    #  @message = showline_message
    #  redirect_to store_path, {notice: @message}
    #end


  #end
  
  def show
    @playlist = Playlist.find(params[:id])
    
  end

  def submit
    binding.pry
    
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
