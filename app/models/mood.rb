
  #create_table "moods", force: :cascade do |t|
  #  t.string   "title"
  #  t.datetime "created_at", null: false
  #  t.datetime "updated_at", null: false
  #end

class Mood < ActiveRecord::Base
  has_many :items
end
