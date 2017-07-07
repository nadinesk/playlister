class AddFreeTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :free_time, :integer
  end
end
