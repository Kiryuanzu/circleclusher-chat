class KakoiRoomsController < ApplicationController
  def show
    @kakoiroom = KakoiRoom.find_by(token: session[:kakoi_room_token])
    @message = Message.new
    if @room
      @messages = @kakoiroom.messages
      @usermessages = @messages.where(kakoi: false)
    else
      token = SecureRandom.uuid
      @room = KakoiRoom.create( token: token)
      session[:kakoi_room_token] = token
      @messages = []
    end
  end
end
