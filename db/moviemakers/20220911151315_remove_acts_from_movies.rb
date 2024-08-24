class RemoveActsFromMovies < ActiveRecord::Migration[7.0]
  def change
    drop_table :acts
  end
end
