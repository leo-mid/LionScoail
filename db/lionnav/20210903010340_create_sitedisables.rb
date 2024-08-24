class CreateSitedisables < ActiveRecord::Migration[6.1]
  def change
    create_table :sitedisables do |t|
      t.string :disable

      t.timestamps
    end
  end
end
