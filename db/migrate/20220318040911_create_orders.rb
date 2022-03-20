class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :shipping_fee, null: false, default: "800"
      t.integer :payment_method
      t.integer :billing_amount
      t.integer :status
      t.string :address
      t.string :postal_code
      t.string :receiver_name
  
      t.timestamps
    end
  end
end
