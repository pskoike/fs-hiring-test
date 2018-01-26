require 'rails_helper'

RSpec.describe Booking, :type => :model do
  it "is valid with valid attributes" do

    motel = Motel.create({
      id: 200,
      name: "Desserts Motel",
      logo: "https://luvotels-hiring-api.herokuapp.com/assets/dessert-motel.jpg"
      })

    room = Room.new({
      id: 412,
      name: "Cream Bomb Suite",
      picture: "https://luvotels-hiring-api.herokuapp.com/assets/cream-bomb-room.jpg",
      })
      room.motel = motel
      room.save

    booking = Booking.new({
      id: 111,
      amount_centavos: 12900,
      fee_percentage: 12,
      booking_period: "2 hours - Weekend",
      created_at: "2017-12-19 11:34:44 +0100",
      paid_at: "2017-12-19 11:53:44 +0100",
      booking_code: "3QWV77N6"
      })
      booking.motel = motel
      booking.room = room
      booking.save

    expect(booking).to be_valid
  end
end
