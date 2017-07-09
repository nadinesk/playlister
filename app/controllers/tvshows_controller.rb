class TvshowsController < ApplicationController
 

  def show
    @tvshow = Tvshow.find params[:id]
  end

  def edit 
	@tvshow = Tvshow.find params[:id]
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
        :title,
        :suspense_level,
        :time_commitment,
        :price
      )
    end

end
