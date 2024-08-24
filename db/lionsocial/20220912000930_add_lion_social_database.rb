class AddLionSocialDatabase < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.string :text

      t.timestamps
    end

    create_table :disables do |t|
      t.string :postdisable
      t.string :conversationdisable
      t.string :homedisable
      t.string :userdisable
    end

    create_table :lsabout do |t|
      t.string :title
      t.text :toppara
      t.text :change
      t.text :list1
      t.text :list2
      t.text :list3
      t.text :buttom
      t.text :linkgithub
      t.text :githubtitle
    end
  end
end
