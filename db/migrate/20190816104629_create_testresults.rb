class CreateTestresults < ActiveRecord::Migration[5.2]
  def change
    create_table :testresults do |t|
      t.integer :score, null: false
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.timestamps
    end
  end
end
