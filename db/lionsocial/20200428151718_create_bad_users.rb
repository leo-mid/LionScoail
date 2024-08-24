class CreateBadUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :badusers do |t|
      t.text :user
      t.text :what

      t.timestamps
    end
  end
end
