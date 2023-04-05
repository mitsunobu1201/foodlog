class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|

      t.integer :user_id,     null:false
      t.integer :food_id,     null:false
      t.date    :ymd,         null:false
      t.integer :timeframe,   null:false
      t.integer :quantity,    null:false
      
      t.timestamps
    end
  end
end
