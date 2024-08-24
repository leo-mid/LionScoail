class CreateActs < ActiveRecord::Migration[6.0]
  def change
    create_table :acts do |t|
      t.text :part
      
      t.timestamps
    end
  end
end
