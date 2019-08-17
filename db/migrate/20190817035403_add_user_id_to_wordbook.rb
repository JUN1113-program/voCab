class AddUserIdToWordbook < ActiveRecord::Migration[5.2]
  def change
    add_column :wordbooks, :user_id, :integer, foreign_key: true
  end
end