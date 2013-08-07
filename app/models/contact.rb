class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :name, :phone, :user_id

  belongs_to( :user, :class_name => "User", :foreign_key =>  :user_id,  :primary_key => :id )
  has_one( :favoriting, :class_name => "Favorite", :foreign_key => :contact_id, :primary_key => :id )
end
