class ChatRoom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user, class_name: "User"
  belongs_to :buddy, class_name: "User"

  def other_user(a_user)
    messages.where.not(user_id: a_user.id).first.user
  end
end
