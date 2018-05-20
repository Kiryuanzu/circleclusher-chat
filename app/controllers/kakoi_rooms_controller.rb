class KakoiRoomsController < ApplicationController
  def show
    @kakoiroom = KakoiRoom.find_by(token: session[:kakoi_room_token])
    @kakoimessage = KakoiMessage.new
    if @kakoiroom
      @kakoimessages = @kakoiroom.kakoi_messages
      @usermessages = @kakoimessages.where(kakoi: false)
    else
      token = SecureRandom.uuid
      @kakoiroom = KakoiRoom.create( token: token)
      session[:kakoi_room_token] = token
      @messages = []
    end
  end
end
