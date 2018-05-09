class RoomsController < ApplicationController
  def show
    @room = Room.find_by(token: session[:room_token])
    @message = Message.new
    if @room
      @messages = @room.messages
    else
      token = SecureRandom.uuid
      @room = Room.create( token: token)
      session[:room_token] = token
      @messages = []
    end
  end
end
