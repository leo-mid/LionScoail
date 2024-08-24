class CreateHelps < ActiveRecord::Migration[6.0]
  def change
    create_table :helps do |t|
      t.text :email
      t.text :number
      t.text :with

      t.timestamps
    end
  end
end
