class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :customer_id
      t.string :receiver_name
      t.string :address
      t.string :postal_code
      t.timestamps
    end
  end
end
