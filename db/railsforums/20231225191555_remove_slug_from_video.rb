class RemoveSlugFromVideo < ActiveRecord::Migration[7.1]
  def change
    remove_column :videos, :slug
  end
end
