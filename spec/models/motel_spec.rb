require 'rails_helper'

RSpec.describe Motel, :type => :model do
  it "is valid with valid attributes" do
    expect(Motel.new).to be_valid
  end
end
