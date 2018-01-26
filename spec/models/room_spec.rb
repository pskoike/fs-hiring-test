require 'rails_helper'

RSpec.describe Room, :type => :model do
  it "is valid with valid attributes" do

    motel = Motel.create({
      "id": 200,
      "name": "Desserts Motel",
      "logo": "https://luvotels-hiring-api.herokuapp.com/assets/dessert-motel.jpg"
      })
    room = Room.new({
      "id": 412,
      "name": "Cream Bomb Suite",
      "picture": "https://luvotels-hiring-api.herokuapp.com/assets/cream-bomb-room.jpg"
      })
      room.motel = motel
    expect(room).to be_valid
  end
end
