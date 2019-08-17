class AddShareToWordbook < ActiveRecord::Migration[5.2]
  def change
    add_column :wordbooks, :share, :integer, null: false
  end
end
