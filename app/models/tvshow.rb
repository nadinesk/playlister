#create_table "tvshows", force: :cascade do |t|
#  t.string   "title"
#  t.integer  "suspense_level"
#  t.integer  "time_commitment"
#  t.integer  "price"
#  t.integer  "mood_id"
#  t.datetime "created_at",  null: false
#  t.datetime "updated_at",  null: false
#end

class Tvshow < ActiveRecord::Base
  has_many :mood_shows
  has_many :moods, through: :mood_shows
  has_many :showlines

  validates :title, :suspense_level, :time_commitment, :price, presence: true

  



end




