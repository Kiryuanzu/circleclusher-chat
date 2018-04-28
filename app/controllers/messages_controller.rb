class MessagesController < ApplicationController
  def new
  end   

  def create 
    room = Room.find_by(token: session[:room_token])
    message = Message.create(message_params)
    message_query = message_params[:text]
    message_url_query = URI.escape(message_query)
    headers = {"Accept" => "application/json", "Authorization" => "Basic NmJmM2FlMWYtYTMwOC00NGQ3LWE4YTgtZTg5NTEzMTc5NGQwOjRscVJoUXlGaVN4Vw=="
    } 
    watsonmessage = HTTParty.get("https://watson-api-explorer.mybluemix.net/discovery/api/v1/environments/#{ENV['WATSON_ENVIROMENT_ID']}/collections/#{ENV['WATSON_COLLECTION_ID']}/query?query=%#{message_url_query}&count=10&version=2018-03-05", :headers => headers  )
    if watsonmessage["results"].present?
      watson_text = watsonmessage["results"][0]["A"]
      Message.create!(text: watson_text, admin: true, room_id: room.id)
      room.update(room_crushpoint: room.crushpoint + 10 )
    end
    redirect_to room_path

  end

  private

  def message_params
    params.require(:message).permit(:room_id, :text)
  end
end
end
