class RoomsController < ApplicationController
  def show
    @message = Message.new

    @room = Room.find_by(token: session[:room_token])
    if @room
      @message = @room.messages
    else
      token = SecureRandom.uuid
      @room = Room.create( token: token)
      session[:room_token] = token
      @messages = []
    end
  end
end
