class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :genre_id
      t.text :description, null: false
      t.boolean :is_active, null: false, default: "販売中"
      t.integer :price, null: false

<<<<<<< HEAD



=======
>>>>>>> 4c05a14b004035c727df7e1d37946148bbe2e00d
      t.timestamps
    end
  end
end