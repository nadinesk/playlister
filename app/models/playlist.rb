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

  def add_tvshow(tvshow_id)
    enough_time, enough_emotional_capital = meet_requirements
    showline = self.showlines.find_by(tvshow_id: tvshow_id)
    if showline
        "You have already added this tv show."
    else
      showline=self.showline.build(tvshow_id: tvshow_id)
    end
    showline
  end


#total for all shows...
  def total
    total = 0
    self.showlines.each do |showline|
      total += showline.tvshow.price
    end
    return total
  end

  def checkout
    self.status = "submitted"
  end

  def add_show
    enough_time, enough_emotional_capital = meet_requirements
    if enough_time && enough_emotional_capital
      start_show
    elsif enough_time && !enough_emotional_capital
      "Sorry. " + emotional_issue
    elsif enough_emotional_capital && !enough_time
      "Sorry. " + time_issue
    else
      "Sorry. " + budget_issue + " and " + emotional_issue
    end
  end

  def meet_requirements
    enough_time, enough_emotional_capital = false
    self.showlines.each do |showline|
      total_time += showline.tvshow.time_commitment
      total_stress += showline.tvshow.suspense_level
    end

    if self.user.free_time >= total_time
      enough_time = true
    end
    if self.user.happiness >= self.tv_show.suspense_level
      enough_emotional_capital = true
    end
    return [enough_time, enough_emotional_capital]
  end

  def start_show
    new_awakeness = self.user.awakness + self.tv_show.awakeness_rating
    new_relaxation = self.user.relaxation + self.tv_show.relaxation_rating
    new_happiness = self.user.happiness + self.tv_show.happiness_rating
    new_budget =  self.user.budget - self.tv_show.cost
    new_time =  self.user.time - self.tv_show.time_commitment
    self.user.update(
      :awakeness => new_awakeness,
      :relaxation => new_relaxation,
      :happiness => new_happiness,
      :budget => new_budget,
      :time => new_time,
    )
    "You can/should watch #{self.tv_show.name}!"
  end

  def budget_issue
    "You do not have enough money to watch #{self.tv_show.title}."
  end

  def time_issue
    "You do not have enough time to watch #{self.tv_show.title}."
  end







end




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
