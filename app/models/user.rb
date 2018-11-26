class User < ApplicationRecord
  has_many :requests, :class_name => 'Request', :foreign_key => 'user_id'
  has_many :requests, :class_name => 'Request', :foreign_key => 'buddy_id'
end
