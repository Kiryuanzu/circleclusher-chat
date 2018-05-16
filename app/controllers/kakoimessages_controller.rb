class KakoimessagesController < ApplicationController
  def new
    @message = KakoiMessage.new
  end   

  def create 
    room = KakoiRoom.find_by(token: session[:kakoi_room_token])
    message = KakoiMessage.create(kakoi_message_params)
    message_query = message_params[:text]
    message_url_query = URI.escape(message_query)
    #headers = {"Accept" => "application/json", "Authorization" => "Basic NmJmM2FlMWYtYTMwOC00NGQ3LWE4YTgtZTg5NTEzMTc5NGQwOjRscVJoUXlGaVN4Vw=="
    } 
    #watsonmessage = HTTParty.get("https://watson-api-explorer.mybluemix.net/discovery/api/v1/environments/#{ENV['WATSON_ENVIROMENT_ID']}/collections/#{ENV['WATSON_COLLECTION_ID']}/query?query=%#{message_url_query}&count=10&version=2018-03-05", :headers => headers  )
    if watsonmessage["results"].present?
      watson_text = watsonmessage["results"][0]["A"]
      KakoiMessage.create!(text: watson_text, kakoi: true, kakoi_room_id: room.id)
      room.update(kakoipoint: room.kakoipoint + 10 )
    end
    if room.kakoipoint >= 50 
      KakoiMessage.create!(text: "好きすぎて辛い", kakoi: true, kakoi_room_id: room.id)
    end
    redirect_to kakoi_room_path

  end

  def destroy
    room = KakoiRoom.find_by(token: session[:kakoi_room_token])
    room.update(kakoipoint: 0)
    @messages = room.messages
    @messages.destroy_all   
    redirect_to kakoi_room_path
  end

  private

  def kakoo_message_params
    params.require(:message).permit(:kakoi_room_id, :text)
  end
end
