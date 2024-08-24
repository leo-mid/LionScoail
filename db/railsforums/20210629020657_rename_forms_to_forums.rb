class RenameFormsToForums < ActiveRecord::Migration[6.1]
  def change
    rename_table :forms, :forums
  end
end
