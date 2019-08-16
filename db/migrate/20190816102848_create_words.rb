class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :front, null: false
      t.string :reverse, null: false
      t.references :wordbook, foreign_key: true
      t.timestamps
    end
  end
end
