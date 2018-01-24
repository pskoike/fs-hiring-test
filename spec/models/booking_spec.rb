require 'rails_helper'

RSpec.describe Booking, :type => :model do
  it "is valid with valid attributes" do
    expect(Booking.new).to be_valid
  end
end
