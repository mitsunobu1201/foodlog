class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|

      t.integer :user_id,             null:false
      t.integer :comment_user_id,     null:false
      t.text    :comment,             null:false
      t.date    :ymd,                 null:false
      t.integer :timeframe,           null:false

      t.timestamps
    end
  end
end
