class CreateScenes < ActiveRecord::Migration[5.1]
  def change
    create_table :scenes do |t|
      t.string :name
      t.text :content
      t.references :movie, foreign_key: true

      t.timestamps
    end
    add_column :scenes, :actor, :string
  end
end
