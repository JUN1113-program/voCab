class AddWordIdToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :word_id, :integer, foreign_key: true
  end
end
