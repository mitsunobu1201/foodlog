class AddSexAndActivityToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sex, :integer, default: 0, null: false
    add_column :users, :activity, :integer, default: 0, null: false
  end
end
