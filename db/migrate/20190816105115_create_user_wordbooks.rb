class CreateUserWordbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_wordbooks do |t|
      t.references :user, foreign_key: true
      t.references :wordbook, foreign_key: true
      t.timestamps
    end
  end
end
