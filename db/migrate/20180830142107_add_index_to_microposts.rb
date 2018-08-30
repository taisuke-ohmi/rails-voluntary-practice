class AddIndexToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_index :microposts, [:user_id, :created_at]
  end
end
