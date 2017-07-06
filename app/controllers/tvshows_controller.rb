class TvshowsController < ApplicationController
  def show
    @tvshow = Tvshow.find params[:id]
  end
end
