class Request < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :buddy, class_name: 'User'

  validates :status, presence: true, inclusion: { in: ["Accepted", "Declined", "Pending", "Waiting"] }

  after_save :create_chat_room, if: :accepted?

  def accepted?
    status == "Accepted"
  end

  private

  def create_chat_room
    chat_room = ChatRoom.find_by(user: user, buddy: buddy)
    ChatRoom.create(user: user, buddy: buddy) unless chat_room.present?
  end
end
