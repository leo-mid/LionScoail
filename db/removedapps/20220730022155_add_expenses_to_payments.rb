class AddExpensesToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenses, :payments, foreign_key: true
    add_reference :payments, :expenses, foreign_key: true
  end
end
