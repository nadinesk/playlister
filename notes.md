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




New Mood form
New nested Tv show form
mood_show table with model
remove 


Add Playlists index page link - header
Add Users index page link - header

Format all pages


    <ul class="nav navbar-nav">

       <li> <%= link_to "PLAYLISTER HOME", store_path %> </li>
       
        <% if current_user && current_user.current_playlist %>
          <li> <%= link_to "Current Playlist", playlist_path(current_user.current_playlist) %> </li>
        <% elsif current_user %>
          <li> <%= link_to "All of Your Playlists", user_playlists_path(current_user) %> </li>
        <li> <%= link_to "Your Profile", user_path(current_user) %> </li>
      <% else %>
        <li><%= link_to "Sign in with Facebook", user_omniauth_authorize_path(:facebook) %></li>
        <% end %>
        <%= render 'layouts/nav_links_for_auth' %>
        
    </ul>




