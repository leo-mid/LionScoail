class RemoveLionFianance < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :expenses, :payments
    remove_foreign_key :expenses, :users
    remove_foreign_key :payments, :expenses
    remove_foreign_key :payments, :users        
    drop_table :expenses
    drop_table :payments
  end
end
