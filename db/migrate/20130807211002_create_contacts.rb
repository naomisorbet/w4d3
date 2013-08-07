class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id, :null => false
      t.string :name
      t.string :email
      t.string :phone
      t.string :address

      t.timestamps
    end
    add_index :contacts, :user_id
  end
end
