class StoreController < ApplicationController

  def index    
    @tvshows = Tvshow.all.order(:title)
    @moods = Mood.order(:title)
  end
  
end
