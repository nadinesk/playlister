class RemoveMoodIdFromTvshows < ActiveRecord::Migration
  def change
  	remove_column :tvshows, :mood_id, :integer
  end
end
