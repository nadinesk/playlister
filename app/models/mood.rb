
  #create_table "moods", force: :cascade do |t|
  #  t.string   "title"
  #  t.datetime "created_at", null: false
  #  t.datetime "updated_at", null: false
  #end

class Mood < ActiveRecord::Base
  has_many :mood_shows
  has_many :tvshows, through: :mood_shows

  accepts_nested_attributes_for :tvshows

  validates :title, presence: true

  def tvshows_attributes=(tvshow_attributes)
    tvshow_attributes.values.each do |tvshow_attribute|
      tvshow = Tvshow.find_or_create_by(tvshow_attribute)
      self.tvshows << tvshow
      binding.pry
    end
  end

   # def tvshows_attributes=(tvshow_attributes)
    #	binding.pry
     #tvshow_attributes.values.each do |tvshow_attribute|
      # tvshow = Tvshow.find_or_create_by(tvshow_attribute)
       #self.tvshows << tvshow
   # end
  # end

   # def tvshows_attributes
    #	binding.pry
     #tvshow_attributes.values.each do |tvshow_attribute|
      # tvshow = Tvshow.find_or_create_by(tvshow_attribute)
       #self.tvshows << tvshow
   # end
  # end

  
end
