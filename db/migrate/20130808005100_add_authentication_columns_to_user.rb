class AddAuthenticationColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :token, :string
  end
end
