require 'httparty'
require './lib/luvotels'
desc 'Fetch Motels and rooms from Luvmotel API and update database'
task :update_db do

    Luvotels::Api.update_database

    #
    # # fetch motels from API
    # api_url = "https://luvotels-hiring-api.herokuapp.com/motels.json"
    # p "fetching Motels from #{api_url}"
    # response = HTTParty.get(api_url)
    # motels_list = response.parsed_response
    # p "fetched #{response.size} motels"
    #
    # # update database
    # motels_list.each do |motel|
    #   if Motel.exists?(motel['id'])
    #     m = Motel.find(motel['id'])
    #     m.update(motel)
    #     p "UPDATED: #{m.id} - #{m.name}"
    #   else
    #     m = Motel.create(motel)
    #     p "CREATED: #{m.id} - #{m.name}"
    #   end
    # end
    #
    # # fetch Room from motels
    # Motel.all.each do |motel|
    #   api_url = "https://luvotels-hiring-api.herokuapp.com/motels/#{motel.id}/rooms.json"
    #   p "fetching Rooms from #{api_url}"
    #   response = HTTParty.get(api_url)
    #   rooms_list = response.parsed_response
    #   p "fetched #{response.size} rooms"
    #
    #   # update database
    #   rooms_list.each do |room|
    #     if Room.exists?(room['id'])
    #       r = Room.find(room['id'])
    #       if r.attributes['name'] != room['name'] || r.attributes['picture'] != room['picture']
    #         r.update(room)
    #         p "UPDATED: #{r.id} - #{r.name}"
    #       else
    #         p "NO CHANGES: #{r.id} - #{r.name}"
    #       end
    #     else
    #       r = Room.create(room)
    #       p "CREATED: #{r.id} - #{r.name}"
    #     end
    #   end
    # end
  end
