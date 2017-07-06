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
    showline = self.showlines.find_by(tvshow_id: tvshow_id)
    if tvshow
        "You have already added this tv show."
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

end
