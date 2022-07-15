class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, null: false
      t.references :zombie, foreign_key: true, null: false
      t.text :body

      t.timestamps
    end
  end
end
