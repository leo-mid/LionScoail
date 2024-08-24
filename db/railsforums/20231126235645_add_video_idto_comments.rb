class AddVideoIdtoComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :video, foreign_key: true
  end
end
