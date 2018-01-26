require 'luvotels'
class MotelsController < ApplicationController

  def index
    @motels = Motel.where(id: current_user.motel_id)
  end

  def show
    @motel = Motel.find(params['id'])
    @rooms = @motel.rooms
    @bookings = filter_booking(@motel, params)
    Luvotels::Api.fetch_and_update_bookings(@motel)
  end

  private

  def filter_booking(motel, params)
    bookings = motel.bookings

    unless params[:room].blank?
      bookings = bookings.where(room_id: params[:room][:room_id]) unless params[:room][:room_id].blank?
    end

    unless params[:booking].blank?
      if params[:booking][:start_date].blank?
        start_date = Time.parse("2000-01-01")
      else
        start_date = Time.parse(params[:booking][:start_date])
      end

      if params[:booking][:end_date].blank?
        end_date = Time.now
      else
        end_date = Time.parse(params[:booking][:end_date])
      end
      bookings = bookings.where(created_at: start_date..end_date)
    end
    bookings
  end
end
