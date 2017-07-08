class StoreController < ApplicationController

  def index
    # binding.pry
    @tvshows = Tvshow.all.order(:title)
    @moods = Mood.order(:title)


    if session[:user_id]
      @user = User.find(session[:user_id])
    end

    binding.pry
  
  end
  
end
