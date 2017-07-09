class ShowlinesController < ApplicationController

  def create
    
    current_user.create_current_playlist unless current_user.current_playlist
    
    showline_message = current_user.current_playlist.add_tvshow(params[:tvshow_id])
 
    if showline_message == ("successfully added tv show")
      showline = current_user.current_playlist.save_show(params[:tvshow_id])
      if showline.save
        redirect_to playlist_path(current_user.current_playlist), {notice: 'Tvshow added to playlist!'}
      else 
        redirect_to store_path, {notice: 'Unable to add tvshow'}
      end
    else
      @message = showline_message
      redirect_to store_path, {notice: @message}
    end
  end

end


