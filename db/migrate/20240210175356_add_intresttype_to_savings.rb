class AddIntresttypeToSavings < ActiveRecord::Migration[7.1]
  def change
    add_column :savings, :intrest, :string
  end
end
