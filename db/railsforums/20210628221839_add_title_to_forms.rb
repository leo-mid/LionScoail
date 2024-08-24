class AddTitleToForms < ActiveRecord::Migration[6.1]
  def change
    add_column :forms, :title, :string
  end
end
