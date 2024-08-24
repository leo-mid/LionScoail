class AddVideosToDisables < ActiveRecord::Migration[7.1]
  def change
    add_column :disables, :video, :string
  end
end
