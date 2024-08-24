class AddPriceToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :price, :string, precision: 8, scale: 2, null: false
  end
end
