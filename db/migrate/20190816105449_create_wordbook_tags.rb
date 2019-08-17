class CreateWordbookTags < ActiveRecord::Migration[5.2]
  def change
    create_table :wordbook_tags do |t|
      t.references :wordbook, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
