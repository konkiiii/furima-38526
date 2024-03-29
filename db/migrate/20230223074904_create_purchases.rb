class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :order, null:false, foreign_key:true
      t.string :postal_code, null:false
      t.integer :prefectures_genre_id, null:false
      t.string :municipalities, null:false
      t.string :address, null:false
      t.string :building
      t.string :phone_number, null:false
      t.timestamps
    end
  end
end
