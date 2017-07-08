class TvshowsController < ApplicationController
  def show
    @tvshow = Tvshow.find params[:id]
  end

  def destroy
  	
  	 @tvshow = Tvshow.find(params[:id])
     @tvshow.destroy
     redirect_to store_path

  end


end
