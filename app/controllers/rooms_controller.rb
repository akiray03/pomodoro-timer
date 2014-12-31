class RoomsController < ApplicationController
  def show
    @room = Room.find_by!(token: params[:id])
    render json: @room
  end

  def create
    room = Room.new(name: params[:name])
    if room.save
      redirect_to room_path(room.token), notice: 'Create room successfully.'
    else
      redirect_to :root, notice: 'Create room failed.'
    end
  end
end
