class DropAdresses < ActiveRecord::Migration[6.1]
  def change
    drop_table :adresses do
    end
  end
end
