class MoodsController < ApplicationController
  def show
    @mood = Mood.find(params[:id])
    @tvshows = @mood.tvshows
  end
end
