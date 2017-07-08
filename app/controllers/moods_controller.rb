class MoodsController < ApplicationController

	def new

		@mood = Mood.new
		@mood.tvshows.build
	end

  	def show
    	@mood = Mood.find(params[:id])
    	@tvshows = @mood.tvshows
  	end

  	def create  		 
  		 @mood = Mood.create(mood_params)	
  		 
  		 redirect_to mood_path(@mood)
  	end




  private
  def mood_params
    params.require(:mood).permit(:title, tvshows_attributes: [:title, :suspense_level, :time_commitment, :price])

  end
end
