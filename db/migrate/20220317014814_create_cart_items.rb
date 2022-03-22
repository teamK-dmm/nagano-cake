class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :count, null: false
<<<<<<< HEAD
      
      belongs_to :item

=======
      t.integer :customer_id
      t.integer :item_id
>>>>>>> origin/develop
      t.timestamps
    end
  end
end
