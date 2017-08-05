
  #create_table "showlines", force: :cascade do |t|
  #  t.integer  "playlist_id"
  #  t.integer  "tvshow_id"
  #  t.integer  "times",   default: 1
  #  t.datetime "created_at",             null: false
  #  t.datetime "updated_at",             null: false
  #end


class Showline < ActiveRecord::Base
  
  belongs_to :tvshow
  belongs_to :playlist
  
end
