class RemoveBadUsers < ActiveRecord::Migration[7.1]
  def change
    drop_table :badusers
  end
end
