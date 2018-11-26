class Appointment < ApplicationRecord
  belongs_to :request
  validates :date, presence: true
  validates :paid, inclusion: { in: [true, false] }
end
