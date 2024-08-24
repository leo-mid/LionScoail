class AddHiddenToAboutsAnnoucments < ActiveRecord::Migration[7.1]
  def up
    add_column :announcements, :hidden, :boolean
  end

  def down
    remove_column :announcements, :hidden
  end
end
