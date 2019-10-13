class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.references :wordbook, foreign_key: true
      t.timestamps
    end
  end
end
