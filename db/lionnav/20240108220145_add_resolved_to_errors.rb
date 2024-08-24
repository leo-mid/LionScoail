class AddResolvedToErrors < ActiveRecord::Migration[7.1]
  def change
    add_column :errors, :resolved, :boolean
  end
end
