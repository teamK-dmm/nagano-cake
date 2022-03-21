class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :genre_id
      t.text :description, null: false
      t.boolean :is_active, null: false, default: "販売中"
      t.integer :price, null: false

      t.timestamps
    end
  end
end
