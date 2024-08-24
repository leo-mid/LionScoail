class RemoveRoomMessages < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :room_messages, :rooms
    remove_foreign_key :room_messages, :users
    drop_table :rooms
    drop_table :room_messages
  end
end
