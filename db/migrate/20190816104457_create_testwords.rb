class CreateTestwords < ActiveRecord::Migration[5.2]
  def change
    create_table :testwords do |t|
      t.string :word, null: false
      t.integer :correct, null: false
      t.references :question, foreign_key: true
      t.timestamps
    end
  end
end
