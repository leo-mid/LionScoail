class CreateForms < ActiveRecord::Migration[6.1]
  def change
    create_table :forms do |t|
      t.text :question

      t.timestamps
      t.references :user, null: false, foreign_key: true
    end
  end
end
