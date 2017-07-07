class CreateMood < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
