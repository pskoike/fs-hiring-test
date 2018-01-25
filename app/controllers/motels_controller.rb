require 'luvotels'
class MotelsController < ApplicationController

  def index
    @motels = Motel.where(id: current_user.motel_id)
  end

  def show
    @motel = Motel.find(params['id'])
    @bookings = @motel.bookings
    @bookings = @motel.bookings.first(params[:filter]) unless params[:filter].blank?
  end

  private

  # def cached_bookings
  #   Rails.cache.fetch("/#{@motel.id}/bookings", expires: 2.hours) do
  #     Luvotels::Api.fetch_and_update_bookings(@motel)
  #   end
  # end
end
