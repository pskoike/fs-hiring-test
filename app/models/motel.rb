class Motel < ApplicationRecord
  has_many :rooms
  has_many :bookings
end
