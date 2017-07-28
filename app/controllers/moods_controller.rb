class MoodsController < ApplicationController

	def new

		@mood = Mood.new
		@mood.tvshows.build
	end

  def index 
    @moods = Mood.all
    respond_to do |format|
        format.html { render :index }
        format.json {  render json: @moods, each_serializer: MoodSerializer }
      end
    
  end


  	def show
    	@mood = Mood.find(params[:id])
    	@tvshows = @mood.tvshows

      respond_to do |format|
        format.html { render :show }
        format.json { render json: @mood }
      end
  	end

  	def create  		 
  		 @mood = Mood.create(mood_params)	
  		 
       if @mood.save
        redirect_to mood_path(@mood)
  		 else
        render :new
       end
  	end




  private
  def mood_params
    params.require(:mood).permit(:title, tvshows_attributes: [:title, :suspense_level, :time_commitment, :price])

  end
end
