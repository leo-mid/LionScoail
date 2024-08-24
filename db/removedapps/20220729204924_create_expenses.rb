class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :title
      t.decimal :amount
      t.date :when
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
