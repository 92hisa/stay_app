class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :caption
      t.string :room_name, null: false
      t.text :room_intro, null: false
      t.string :price, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
