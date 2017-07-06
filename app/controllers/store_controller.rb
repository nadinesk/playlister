class StoreController < ApplicationController

  def index
    # binding.pry
    @tvshows = Tvshow.all.order(:title)
    @moods = Mood.order(:title)
  end
  
end
