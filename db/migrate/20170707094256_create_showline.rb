class CreateShowline < ActiveRecord::Migration
  def change
    create_table :showlines do |t|
      t.integer :playlist_id
      t.integer :tvshow_id
      t.timestamps null: false
    end
  end
end
