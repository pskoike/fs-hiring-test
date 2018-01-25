class MotelsController < ApplicationController

  def index
    @motels = Motel.all
  end

  def show
    @motel = Motel.find(params['id'])
  end
end
