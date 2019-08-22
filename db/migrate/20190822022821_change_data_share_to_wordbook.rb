class ChangeDataShareToWordbook < ActiveRecord::Migration[5.2]
  def change
    change_column :wordbooks, :share, :boolean
  end
end
