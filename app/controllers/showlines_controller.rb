class ShowlinesController < ApplicationController
  def create
    current_user.create_current_playlist unless current_user.current_playlist
    showline = current_user.current_playlist.add_item(params[:tvshow_id])
    if line_item.save
      redirect_to cart_path(current_user.current_cart), {notice: 'Item added to cart!'}
    else
      redirect_to store_path, {notice: 'Unable to add item'}
    end
  end
end



#add methods at: playlist.add_item
