class CreateOders < ActiveRecord::Migration[6.1]
  def change
    create_table :oders do |t|

      t.timestamps
    end
  end
end
