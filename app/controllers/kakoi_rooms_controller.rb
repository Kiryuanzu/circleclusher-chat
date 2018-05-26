class KakoiRoomsController < ApplicationController
  def show
    @kakoiroom = KakoiRoom.find_by(token: session[:kakoi_room_token])
    @kakoimessage = KakoiMessage.new
    if @kakoiroom
      @kakoimessages = @kakoiroom.kakoi_messages.order("created_at ASC")
      @usermessages = @kakoimessages.where(kakoi: false)
    else
      token = SecureRandom.uuid
      @kakoiroom = KakoiRoom.create( token: token)
      session[:kakoi_room_token] = token
      @kakoimessages = @kakoiroom.kakoi_messages
    end
  end
end
