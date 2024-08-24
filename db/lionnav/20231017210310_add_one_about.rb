class AddOneAbout < ActiveRecord::Migration[7.1]
  def change
    create_table :abouts do |t|
      t.string :title
      t.text :toppara
      t.text :change
      t.text :list1
      t.text :list2
      t.text :list3
      t.text :buttom
      t.text :linkgithub
      t.text :githubtitle
      t.string :site
      
      t.timestamps
    end

    drop_table :mabouts
    drop_table :lsabouts
  end
end
