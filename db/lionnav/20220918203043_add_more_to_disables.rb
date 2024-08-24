class AddMoreToDisables < ActiveRecord::Migration[7.0]
  def change
    add_column :disables, :movie, :string
    add_column :disables, :scene, :string
    add_column :disables, :credit, :string
    add_column :disables, :error, :string
    add_column :disables, :expense, :string
    add_column :disables, :forums, :string
    add_column :disables, :lsabout, :string
    add_column :disables, :payment, :string
    add_column :disables, :picturescene, :string
    add_column :disables, :lionsocial, :string
    add_column :disables, :lionfianace, :string
    add_column :disables, :moviemaker, :string
    add_column :disables, :tutorial, :string
    add_column :disables, :myaccont, :string
  end
end
