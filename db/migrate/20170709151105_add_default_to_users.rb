class AddDefaultToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :happiness, :integer, :default => 1
  	change_column :users, :free_time, :integer, :default => 1
  end
end
