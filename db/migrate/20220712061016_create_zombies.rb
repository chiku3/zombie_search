class CreateZombies < ActiveRecord::Migration[5.2]
  def change
    create_table :zombies do |t|
      t.string :name
      t.text :body
      t.string :image_id

      t.timestamps
    end
  end
end
