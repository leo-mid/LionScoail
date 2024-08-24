class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room

  def index
    @page_title = "Chat rooms Lion social"
    @room = Room.new
    @user = current_user
    @rooms = Room.order('name ASC')
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new permitted_parameters
    @rooms = Room.all
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
    else
      render :new
    end
  end

  def show
    @page_title = "#{@room.name} Lion social"
    @user = current_user
    @room_message = @room.room_messages.new
    @room_messages = @room.room_messages
    @room_messages = @room_messages.by_newest
    @rooms = Room.order('name ASC')
  end

  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  protected

  def set_room
    @rooms = Room.all
    @room = Room.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room).permit(:name, :description)
  end
end
