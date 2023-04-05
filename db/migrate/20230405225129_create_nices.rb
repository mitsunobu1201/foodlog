class CreateNices < ActiveRecord::Migration[7.0]
  def change
    create_table :nices do |t|
      
      t.integer :user_id,             null:false
      t.integer :nice_user_id,        null:false
      t.date    :ymd,                 null:false
      t.integer :timeframe,           null:false
      
      t.timestamps
    end
  end
end
