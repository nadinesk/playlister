class CreateTable < ActiveRecord::Migration
  def change
    create_table :mood_shows do |t|
      t.integer :mood_id
      t.integer :tvshow_id
      t.timestamps null: false
    end
  end
end
