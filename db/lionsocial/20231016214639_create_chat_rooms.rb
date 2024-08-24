class CreateChatRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    add_index :rooms, :name, unique: true
    
    create_table :room_messages do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end

    add_column :disables, :chatrooms, :string

  end
end
