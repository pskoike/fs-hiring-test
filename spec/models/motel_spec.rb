require 'rails_helper'

RSpec.describe Motel, :type => :model do
  it "is valid with valid attributes" do
    motel = Motel.create({
      "id": 200,
      "name": "Desserts Motel",
      "logo": "https://luvotels-hiring-api.herokuapp.com/assets/dessert-motel.jpg"
      })
    expect(motel).to be_valid
  end
end
