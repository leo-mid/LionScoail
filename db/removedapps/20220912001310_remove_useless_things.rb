class RemoveUselessThings < ActiveRecord::Migration[7.0]
  def change
    drop_table :comics
  end  
end
