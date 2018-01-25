class Booking < ApplicationRecord
  belongs_to :motel
  belongs_to :room

  default_scope { order('created_at DESC') }
end
