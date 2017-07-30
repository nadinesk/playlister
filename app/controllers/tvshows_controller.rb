class TvshowsController < ApplicationController
 

  def index
    @mood = Mood.find(params[:mood_id])
    
    @tvshows = @mood.tvshows
    
  end
  
  def show

    @tvshow = Tvshow.find(params[:id])
  end

  def new
    @mood = Mood.find(params[:mood_id])
    @tvshow = Tvshow.new

  end


  def edit 
	 @tvshow = Tvshow.find(params[:id])
  end

  def create
    binding.pry
    @mood = Mood.find(params[:mood_id])
    @tvshow = @mood.tvshows.build(tvshow_params)      
    @mood.save
    
     if @tvshow.save
      # I need to render something that just has the LI I want...
      # why not just create a comments/show view that shows the LI of one comment?
      # render 'comments/show', :layout => false
      #binding.pry
      
      #render 'create.js', :layout => false
    else
    #  render "posts/show"
    end
  end


  def destroy  	
  	 @tvshow = Tvshow.find(params[:id])
     @tvshow.destroy
     redirect_to store_path
  end

  def update
  	@tvshow = Tvshow.find(params[:id])
  	respond_to do |format|
      if @tvshow.update(tvshow_params)
        format.html { redirect_to @tvshow, notice: 'Tv Show was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  private
  def tvshow_params
      params.require(:tvshow).permit( 
        :id, 
        :title,
        :suspense_level,
        :time_commitment,
        :price,        
        :mood_ids
      )
    end

end
