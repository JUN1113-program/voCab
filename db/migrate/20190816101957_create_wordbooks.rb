class CreateWordbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :wordbooks do |t|
      t.string :title, null: false
      t.integer :viewed, null: false
      t.string :reference
      t.timestamps
    end
  end
end
