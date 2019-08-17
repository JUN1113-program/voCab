class CreateTag < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name, null: false, unique: true
      t.string :entry, null: false
      t.timestamps
    end
  end
end
