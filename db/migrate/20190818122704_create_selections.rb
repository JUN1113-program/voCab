class CreateSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :selections do |t|
      t.references :testword, foreign_key: true
      t.references :testresult, foreign_key: true
      t.timestamps
    end
  end
end
