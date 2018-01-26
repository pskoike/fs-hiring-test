require 'httparty'
require './lib/luvotels'
desc 'Fetch Motels and rooms from Luvmotel API and update database'
task :update_db do
    p "Fetching data from Luvoltels API"
    Luvotels::Api.update_database
    p "Done"
  end
