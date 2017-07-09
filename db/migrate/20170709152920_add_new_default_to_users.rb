class AddNewDefaultToUsers < ActiveRecord::Migration
  def change
  	change_column :users, :happiness, :integer, :default => 11
  	change_column :users, :free_time, :integer, :default => 11
  end
end
