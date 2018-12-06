class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user, class_name: "User"
  belongs_to :buddy, class_name: "User"

  scope :with_buddy, ->(a_buddy) { where(buddy: a_buddy) }
end

