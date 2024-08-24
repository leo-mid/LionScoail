class AddHidenToAbout < ActiveRecord::Migration[7.1]
  def up
    add_column :abouts, :hidden, :boolean
  end

  def down
    remove_column :abouts, :hidden
  end
end
