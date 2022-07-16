class AddUserIdToZombies < ActiveRecord::Migration[5.2]
  def change
    add_column :zombies, :user_id, :integer
  end
end
