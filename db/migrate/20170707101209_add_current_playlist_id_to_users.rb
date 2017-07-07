class AddCurrentPlaylistIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :current_playlist_id, :integer
  end
end
