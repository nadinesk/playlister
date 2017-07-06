#create_table "tvshows", force: :cascade do |t|
#  t.string   "title"
#  t.integer  "suspense_level"
#  t.integer  "time_commitment"
#  t.integer  "price"
#  t.integer  "mood_id"
#  t.datetime "created_at",  null: false
#  t.datetime "updated_at",  null: false
end

class TvShow < ActiveRecord::Base
  belongs_to :mood
  has_many :showlines

  # maybe add some stuff about decreasing awakeness, happiness, etc. has_secure_password

#  def self.available_items
#     where('inventory > ?', 0)
#   end

#   def remove(amount)
#     update(inventory: inventory - amount)
#   end
end




# where to add these
  #def watch_show
  #  enough_time, enough_money = meet_requirements
  #  if enough_time && enough_money
  #    start_show
  #  elsif enough_time && !enough_money
  #    "Sorry. " + budget_issue
  #  elsif enough_money && !enough_time
  #    "Sorry. " + time_issue
  #  else
  #    "Sorry. " + budget_issue + " and " + time_issue
  #  end
  #end

  #def meet_requirements
  #  enough_time, enough_money = false
  #  if self.user.free_time >= self.tv_show.time_commitment
  #    enough_time = true
  #  end
  #  if self.user.budget >= self.tv_show.cost
  #    enough_money = true
  #  end
  #  return [enough_time, enough_money]
  #end

  #def start_show
  #  new_awakeness = self.user.awakness + self.tv_show.awakeness_rating
  #  new_relaxation = self.user.relaxation + self.tv_show.relaxation_rating
  #  new_happiness = self.user.happiness + self.tv_show.happiness_rating
  #  new_budget =  self.user.budget - self.tv_show.cost
  #  new_time =  self.user.time - self.tv_show.time_commitment
  #  self.user.update(
  #    :awakeness => new_awakeness,
  #    :relaxation => new_relaxation,
  #    :happiness => new_happiness,
  #    :budget => new_budget,
  #    :time => new_time,
  #  )
  #  "You can/should watch #{self.tv_show.name}!"
  #end

  #def budget_issue
  #  "You do not have enough money to watch #{self.tv_show.title}."
  #end

  #def time_issue
  #  "You do not have enough time to watch #{self.tv_show.title}."
  #end
