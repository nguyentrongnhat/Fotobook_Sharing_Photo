class AddAvatarToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar, :string, default: "none"
  end
end
