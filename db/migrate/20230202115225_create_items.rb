class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user , null:false, foreign_key:true
      t.string :product_name, null:false
      t.text :description, null:false
      t.integer :category_genre_id, null:false
      t.integer :condition_genre_id, null:false
      t.integer :delivery_charge_genre_id, null:false
      t.integer :prefectures_genre_id, null:false
      t.integer :days_to_ship_genre_id, null:false
      t.integer :price, null:false
      t.timestamps
    end
  end
end
