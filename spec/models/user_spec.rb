require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do

    motel = Motel.create({
      "id": 200,
      "name": "Desserts Motel",
      "logo": "https://luvotels-hiring-api.herokuapp.com/assets/dessert-motel.jpg"
      })

    user = User.create({
      email: 'jb@luvotels.com',
      password: '112233',
      motel: motel,
      })

    expect(user).to be_valid
  end
end
