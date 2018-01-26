require 'httparty'
describe "Luvoltels Service API" do
  it 'fetch motels from Luvotels API' do

    api_url = "https://luvotels-hiring-api.herokuapp.com/motels.json"
    response = HTTParty.get(api_url)
    # test for the 200 status-code
    expect(response).to be_success
    # check response size
    expect(response.parsed_response.size).to be >= 1
  end

  it 'fetch rooms from Luvotels API' do

    api_url = "https://luvotels-hiring-api.herokuapp.com/motels/200/rooms.json"
    response = HTTParty.get(api_url)
    # test for the 200 status-code
    expect(response).to be_success
    # check response size
    expect(response.parsed_response.size).to be >= 1
  end

  it 'fetch bookings from Luvotels API' do

    api_url = "https://luvotels-hiring-api.herokuapp.com/motels/200/bookings.json"
    response = HTTParty.get(api_url)
    # test for the 200 status-code
    expect(response).to be_success
    # check response size
    expect(response.parsed_response.size).to be >= 1
  end
end
