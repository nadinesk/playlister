#create_table "playlists", force: :cascade do |t|
#    t.integer  "user_id"
#    t.string   "status",     default: "not submitted"
#    t.datetime "created_at",                           null: false
#    t.datetime "updated_at",                           null: false
#  end


class Playlist < ActiveRecord::Base
  has_many :showlines
  has_many :tvshows, through: :showlines
  belongs_to :user

  

  def tvshows_attributes=(tvshow)   

    self.tvshow = Tvshow.find_or_create_by(title: tvshow.title)
    self.tvshow.update(tvshow)
  end
  
  def save_show(tvshow_id)
    showline=self.showlines.build(tvshow_id: tvshow_id)
    showline
  end


  def add_tvshow(tvshow_id)

  
    showline = self.showlines.find_by(tvshow_id: tvshow_id)
    
    
    enough_time, enough_emotional_capital = meet_requirements(tvshow_id)

    if showline
        "You have already added this tv show."
    else
        if enough_time && enough_emotional_capital          
          "successfully added tv show"
        elsif enough_time && !enough_emotional_capital
          "Sorry. " + emotional_issue
        elsif enough_emotional_capital && !enough_time
          "Sorry. " + time_issue
        else
          "Sorry. " + emotional_issue + " and " + time_issue
        end
    end
  end


#total for all shows...
  def total
    total = 0
    if self.showlines      
      self.showlines.each do |showline|
        total += showline.tvshow.price
      end    
    end
    
    return total
  end

  def total_suspense(tvshow_id)
    tvshow = Tvshow.find_by(id: tvshow_id)
    s_total = 0
    if self.showlines      
      self.showlines.each do |showline|
        s_total += showline.tvshow.suspense_level
      end    
    end    
    s_total += tvshow.suspense_level
    return s_total
  end

  def total_suspense_view
    
    s_total = 0
    if self.showlines      
      self.showlines.each do |showline|
        s_total += showline.tvshow.suspense_level
      end    
    end    
    
    return s_total
  end

  def total_time(tvshow_id)

    tvshow = Tvshow.find_by(id: tvshow_id)
    time_total = 0
    if self.showlines       
      self.showlines.each do |showline|        
        time_total += showline.tvshow.time_commitment
      end    
    end
    time_total += tvshow.time_commitment         
    return time_total 
  end

  def total_time_view 
    time_total = 0
    if self.showlines       
      self.showlines.each do |showline|        
        time_total += showline.tvshow.time_commitment
      end    
    end
    return time_total 
  end

  

  def submit_list      
    user.remove_cart
  end

  def change_attributes
    update(status: 'submitted')
      new_happiness = self.user.happiness - total_suspense_view
      new_free_time = self.user.free_time - total_time_view
      self.user.update(
        :happiness => new_happiness,
        :free_time => new_free_time
      )
    
  end

  def meet_requirements(tvshow_id)
    
    enough_time, enough_emotional_capital = false

    if user.free_time >= total_time(tvshow_id)
      enough_time = true
    end
    if user.happiness >= total_suspense(tvshow_id)
      enough_emotional_capital = true
    end

    
    return [enough_time, enough_emotional_capital]

  end

  def time_issue
    
    "You do not have enough time to watch this show."
  end

  def emotional_issue
    
    "Watching this show will stress you out too much."
  end

end


###############



# see this from RAP solution #
#class RidesController < ApplicationController

#  def new
#    @ride = Ride.create(
#      :user_id => params[:user_id],
#      :attraction_id => params[:attraction_id]
#    )
#    @message = @ride.take_ride
#    redirect_to user_path(@ride.user, :message => @message)
#  end

# end

# put the message wherever the page redirects to after adding the item (carts_controller is it?)

#class UsersController < ApplicationController
#  before_action :set_user, only: [:show, :edit, :update, :destroy]

#  def show
#    @message = params[:message] if params[:message]
#    @message ||= false
#  end








  #def change_inventory
  #  if self.status = "submitted"
  #    self.line_items.each do |line_item|
  #      line_item.item.inventory -= line_item.quantity
  #      line_item.item.save
  #    end
  #  end
  #end
  #has_many :showlines
  #has_many :tvshows, through: :showlines

  #belongs_to :user

  #def add_item(tvshow_id)
  #  if tvshow_ids.include?(tvshow_id.to_i)
  #    current_showline = showlines.find_by(tvshow_id: tvshow_id)
  #    current_showline
  #  else
  #    showlines.build(tvshow_id: tvshow_id)
  #  end
  #end

  #def total
  #  line_items.inject(0) { |sum, line_item| sum + line_item.total}
  #end

  #def checkout
  #  remove_inventory
  #  user.remove_cart
  #  update(status: 'submitted')
  #end

  #private

  #def remove_inventory
#    line_items.each do |line_item|
#      line_item.item.remove(line_item.quantity)
#    end
#  end
