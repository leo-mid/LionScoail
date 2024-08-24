class ChnageWhenToTime < ActiveRecord::Migration[7.0]
  def change
    rename_column :expenses, :when, :time
  end
end
