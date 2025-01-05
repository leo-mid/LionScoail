class RemoveLionFiance < ActiveRecord::Migration[7.1]
  def change
    drop_table :savings
    drop_table :purchases
    drop_table :payments
  end
end
