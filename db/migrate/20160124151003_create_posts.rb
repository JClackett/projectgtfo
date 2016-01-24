class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :user_id
      t.string :video

      t.timestamps null: false
    end
  end
end
