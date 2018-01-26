require 'httparty'
module Luvotels
  class Api

      # called by rake update_db - Cron task
      def self.update_database
        update_motels(fetch_motels)
        update_rooms(fetch_rooms)
      end

      # Cached request to fetch bookings
      def self.fetch_and_update_bookings(motel)
        update_bookings(fetch_bookings(motel))
      end

      private

      # fetch motels from API
      def self.fetch_motels
        api_url = "https://luvotels-hiring-api.herokuapp.com/motels.json"
        response = HTTParty.get(api_url)
        p "fetched #{response.size} motels from #{api_url}"
        motels_list = response.parsed_response
      end

      # fetch motels from API
      def self.fetch_rooms
        rooms_list = []
        Motel.all.each do |motel|
          api_url = "https://luvotels-hiring-api.herokuapp.com/motels/#{motel.id}/rooms.json"
          response = HTTParty.get(api_url)
          rooms_list << response.parsed_response
          p "fetched #{response.size} rooms from #{api_url}"
        end
        rooms_list.flatten
      end

      # fetch bookings from API
      def self.fetch_bookings(motel)
        api_url = "https://luvotels-hiring-api.herokuapp.com/motels/#{motel.id}/bookings.json"
        cache_key = "#{motel.id}/bookings"
        response = cached_response(cache_key, api_url)
      end

      # update or create motels in the database
      def self.update_motels(motels)
        motels.each do |motel|
          if Motel.exists?(motel['id'])
            m = Motel.find(motel['id'])
            m.update(motel)
            p "UPDATED: #{m.id} - #{m.name}"
          else
            m = Motel.create(motel)
            p "CREATED: #{m.id} - #{m.name}"
          end
        end
      end

      # update or create rooms in the database.
      def self.update_rooms(rooms)
        rooms.each do |room|
          if Room.exists?(room['id'])
            r = Room.find(room['id'])
            if r.attributes['name'] != room['name'] || r.attributes['picture'] != room['picture']
              r.update(room)
              p "UPDATED: #{r.id} - #{r.name}"
            else
              p "NO CHANGES: #{r.id} - #{r.name}"
            end
          else
            r = Room.create(room)
            p "CREATED: #{r.id} - #{r.name}"
          end
        end
      end

      # Update bookings with request has more them 10 records comparing to the database
      def self.update_bookings(response)
        if response.size - 10 > Booking.where(motel: response.first['motel_id'].to_i).size
          response.map do |booking|
            Booking.create(booking) unless Booking.exists?(booking['id'])
            # if exists? && Booking.find(booking['id']) =! booking => Booking.update({booking})
          end
        end
      end

      # Cached Get request to Luvmotels API.
      def self.cached_response(key, url)
        Rails.cache.fetch(key, expires: 10.minutes) do
          response = HTTParty.get(url)
          response = response.parsed_response if response.success?
        end
      end
  end
end
