class AddSiteToComments < ActiveRecord::Migration[7.1]
  def up
    add_column :comments, :site, :string
  end

  def down
    remove_column :comments, :site
  end
end
