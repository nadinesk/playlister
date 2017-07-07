class ShowlinesController < ApplicationController

  def create
    current_user.create_current_playlist unless current_user.current_playlist
    showline = current_user.current_playlist.add_tvshow(params[:tvshow_id])
    if showline.save
      redirect_to cart_path(current_user.current_playlist), {notice: 'Item added to cart!'}
    else
      @message = current_user.current_playlist.add_tvshow
      redirect_to store_path, {notice: @message}
    end
  end
end
