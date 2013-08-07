class User < ActiveRecord::Base
  attr_accessible :email, :name
  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true

  has_many(:contacts, :class_name => "Contact", :foreign_key => :user_id, :primary_key => :id)
  has_many(:favorites, :class_name => "Favorite", :foreign_key => :user_id, :primary_key => :id)
end
