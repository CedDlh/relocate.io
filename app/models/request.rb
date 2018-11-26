class Request < ApplicationRecord
  belongs_to :user, :class_name => 'User'
  belongs_to :buddy, :class_name => 'User'
end
