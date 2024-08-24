class CreateComics < ActiveRecord::Migration[6.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.text :decrpition
      t.string :by
      t.string :number
      t.string :siries

      t.timestamps
    end
  end
end
