class RoomsController < ApplicationController
  before_action :set_room, only: %i(show update start stop)

  def show
    respond_to do |format|
      format.html
      format.json { render json: @room.attrs }
    end
  end

  def create
    room = Room.new(timer: params[:timer])
    if room.save
      redirect_to room_path(room.token), notice: 'Create room successfully.'
    else
      redirect_to :root, notice: 'Create room failed.'
    end
  end

  def update
    if @room.update_attributes(timer: params[:timer])
      redirect_to room_path(@room), notice: 'Update room successfully.'
    else
      redirect_to room_path(@room), notice: 'Update room failed.'
    end
  end

  def start
    @room.start!
    redirect_to room_path(@room)
  end

  def stop
    @room.stop!
    redirect_to room_path(@room)
  end

  private

  def set_room
    @room = Room.find_by!(token: params[:id])
  end
end
