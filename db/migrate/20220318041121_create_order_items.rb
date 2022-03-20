class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.string :making_status
      t.string :count
      t.string :price

      t.timestamps
    end
  end
end
