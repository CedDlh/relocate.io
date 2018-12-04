class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user, class_name: "User"
  belongs_to :buddy, class_name: "User"
end
