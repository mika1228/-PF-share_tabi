class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :category_id
      t.integer :user_id
      t.text :spot_name
      t.string :post_image
      t.date :date
      t.integer :prefecture
      t.text :address
      t.float :latitude
      t.float :longitude
      t.text :post_comment
      t.boolean :is_active, null: false, default: true
      

      t.timestamps
    end
  end
end
