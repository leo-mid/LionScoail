class AddSiteToAnnoucements < ActiveRecord::Migration[7.1]
  def change
    add_column :announcements, :site, :string
  end
end
