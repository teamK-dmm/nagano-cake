class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.integer :count, null: false
      
      belongs_to :item

      t.timestamps
    end
  end
end
