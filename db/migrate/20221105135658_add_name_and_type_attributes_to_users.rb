class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :type, :string, null: false, default: "User" 
    add_index :users, :type
    remove_column :users, :user_type, :string
    remove_column :users, :name, :string
  end
end