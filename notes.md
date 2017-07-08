class MoodShow < ActiveRecord::Migration
  def change
    create_table :mood_shows do |t|
      t.integer :mood_id
      t.integer :tvshow_id
      t.timestamps null: false
    end
  end
end


class Mood

	has_many :mood_shows
	has_many :tvshows, through: :mood_shows


end

class Tvshow
	has_many :mood_shows
	has_many :moods, through: :mood_shows

end


  create_table "tvshows", force: :cascade do |t|
    t.string   "title"
    t.integer  "suspense_level"
    t.integer  "time_commitment"
    t.integer  "price"
   #### t.integer  "mood_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end


MoodsController file
def goal_params
    params.require(:mood).permit(tvshow_attributes: [mood_show: [tvshow_attributes:[]]])
end


<%= form_for @mood do |f| %>
   <%= f.fields_for :tvshows do |t| %>
      <%= t.fields_for :mood_shows do |ms| %>
          <%= ms.fields_for :tvshow do |t| %>
               <%= t.text_field :title %>
          <% end %>
      <% end %>
   <% end %>
   <%= f.submit %>
<% end %>



