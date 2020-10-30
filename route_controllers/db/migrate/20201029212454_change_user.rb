class ChangeUser < ActiveRecord::Migration[5.2]
  def change 
    rename_column :users, :name, :username
    add_index :users, :username, unique: true
    remove_column :users, :email
  end
end
