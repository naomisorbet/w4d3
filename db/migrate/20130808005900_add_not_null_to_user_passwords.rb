class AddNotNullToUserPasswords < ActiveRecord::Migration
  def change
    change_column :users, :password, :string, :null => false
  end
end
