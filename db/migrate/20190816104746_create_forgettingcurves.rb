class CreateForgettingcurves < ActiveRecord::Migration[5.2]
  def change
    create_table :forgettingcurves do |t|
      t.integer :tenminutes, null:false
      t.integer :onehour, null:false
      t.integer :oneday, null:false
      t.integer :type, null:false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
