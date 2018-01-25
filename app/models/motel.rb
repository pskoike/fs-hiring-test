class Motel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :bookings
  belongs_to :user

  validates :name, presence: true
end
