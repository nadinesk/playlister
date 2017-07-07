class CreateTvshow < ActiveRecord::Migration
  def change
    create_table :tvshows do |t|
      t.string :title
      t.integer :suspense_level
      t.integer :time_commitment
      t.integer :price
      t.integer :mood_id
      t.timestamps null: false
    end
  end
end
