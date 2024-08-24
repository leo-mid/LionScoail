class CreateMabouts < ActiveRecord::Migration[7.0]
  def change
    create_table :mabouts do |t|
      t.string :title
      t.text :toppara
      t.text :change
      t.text :list1
      t.text :list2
      t.text :list3
      t.text :buttom
      t.text :linkgithub
      t.text :githubtitle
      
      t.timestamps
    end
  end
end
