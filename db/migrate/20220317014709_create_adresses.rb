class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|
      t.string :receiver_name
      t.string :address
      t.string :postal_code
      t.datetime :created_at, null: false, default: "now"
      t.datetime :updated_at, null: false, default: "now"

      t.timestamps
    end
  end
end
