class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      
      t.integer :user_id,       null:false
      t.string  :name,          null:false
      t.integer :calorie,       null:false
      t.float   :protein,       null:false
      t.float   :fat,           null:false
      t.float   :carbohydrate,  null:false
      t.text    :explanation

      t.timestamps
    end
  end
end
