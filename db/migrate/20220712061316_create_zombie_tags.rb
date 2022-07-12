class CreateZombieTags < ActiveRecord::Migration[5.2]
  def change
    create_table :zombie_tags do |t|
      t.references :zombie, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
