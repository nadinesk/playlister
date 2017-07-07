class CreatePlaylist < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.string :status, default: 'not submitted'
 	  t.timestamps null: false
    end
  end
end
