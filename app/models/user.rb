class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :requests, :class_name => 'Request', :foreign_key => 'user_id'
  has_many :requests, :class_name => 'Request', :foreign_key => 'buddy_id'
  has_many :availabilities

  # # validations for both:
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :buddy, inclusion: { in: [true, false] }
  # validations for buddy only:
  validates :plz, presence: true, if: :buddy?
  validates :languages, presence: true, if: :buddy?
  validates :specialties, presence: true, if: :buddy?

  include PgSearch
  pg_search_scope :search_buddy,
                  against: [:plz, :specialties],
                  using: {
                    tsearch: { prefix: true }
                  }
  pg_search_scope :search_date,
                  against: [:availabilities],
                  using: {
                    tsearch: { prefix: true }
                  }

  def buddy?
    buddy == true
  end

  geocoded_by :plz
  after_validation :geocode, if: :will_save_change_to_plz?

  mount_uploader :photo, PhotoUploader
end
