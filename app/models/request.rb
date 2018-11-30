class Request < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :buddy, class_name: 'User'

  validates :status, presence: true, inclusion: { in: ["Accepted", "Declined", "Pending", "Waiting"] }
end
