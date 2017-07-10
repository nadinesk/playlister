class Admin::StatsController < ApplicationController
  def index
 	
    
    @user_count = User.count
    @mood_count = Mood.count
    @tvshow_count = Tvshow.count

    @users = User.all
    @tvshows = Tvshow.all

    max_user = @users.order("happiness DESC").first
    @max_user_happiness_name = max_user.name
    @max_user_happiness_level = max_user.happiness

    

    least_expensive = @tvshows.order("price").first
    @least_expensive_title = least_expensive.title
    @least_expensive_length = least_expensive.price

  
 
  end
end