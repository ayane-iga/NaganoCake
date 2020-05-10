class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :text
      t.boolean :is_valid
      t.integer :tax_free_price
      t.string :item_image_id

      t.timestamps
    end
  end
end
