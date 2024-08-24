class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.text :title
      t.string :length
      t.text :resource
      t.string :link
      t.string :slug
      t.index :slug, unique: true

      t.timestamps
    end
  end
end
