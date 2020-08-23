class AddCountfollowingsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :count_of_followings, :int, :default => 0
  end
end
