class RemoveTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :helps
    drop_table :suggestions
  end
end
