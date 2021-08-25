class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :order_status, default:0
      t.integer :total_price
      t.integer :carriage
      t.integer :payment_method, default:0
      t.string :post_code
      t.text :address
      t.string :destination

      t.timestamps
    end
  end
end
