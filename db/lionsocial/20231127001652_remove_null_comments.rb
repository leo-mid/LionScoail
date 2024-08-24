class RemoveNullComments < ActiveRecord::Migration[7.1]
  def up
    change_column_null :comments, :post_id, true
  end
  
  def down
    change_column_null :comments, :post_id, false
  end
end
