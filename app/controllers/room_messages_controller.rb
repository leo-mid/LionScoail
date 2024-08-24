class RoomMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def index
    @page_title = "#{@room.name} Lion social"
    @user = current_user
    @room_message = @room.room_messages.new
    @room_messages = @room.room_messages
    @room_messages = @room_messages.by_newest
    @rooms = Room.order('name ASC')
  end

  def create
    @room_message = @room.room_messages.new(room_message_params)
    @room_message.user = current_user
    @room_messages = @room.room_messages
    respond_to do |format|
      if @room_message.save
        format.html { redirect_to room_room_messages_path(@room) }
        format.js { render :index, status: :created, location: room_room_messages_path(@room) }
      else
        format.html { render room_room_messages_path(@room)}
      end
    end
  end

  protected

  def set_room
    @room = Room.find(params[:room_id])
  end

  def room_message_params
    params.require(:room_message).permit(:message)
  end
end
