require 'rails_helper'

RSpec.describe Room, :type => :model do
  it "is valid with valid attributes" do
    expect(Room.new).to be_valid
  end
end
