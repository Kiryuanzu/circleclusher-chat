class RoomsController < ApplicationController
  def show
    @room = Room.find_by(token: session[:room_token])
    @message = Message.new
    if @room
      @messages = @room.messages
      @usermessages = @messages.where(clusher: false)
    else
      token = SecureRandom.uuid
      @room = Room.create( token: token)
      session[:room_token] = token
      @messages = @room.messages
    end
  end
end
