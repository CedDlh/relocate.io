class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requests, :class_name => 'Request', :foreign_key => 'user_id'
  has_many :requests, :class_name => 'Request', :foreign_key => 'buddy_id'

  # validations for both:
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :buddy, inclusion: { in: [true, false] }
  # validations for buddy only:
  validates :plz, presence: true, if: :buddy?
  validates :languages, presence: true, if: :buddy?
  validates :specialties, presence: true, if: :buddy?

  def buddy?
    buddy == true
  end
end
