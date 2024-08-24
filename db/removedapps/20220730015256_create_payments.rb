class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :option
      t.string :info
      t.decimal :amount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
