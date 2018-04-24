class MessagesController < ApplicationController
  def new
  end   

  def create 
    room = Room.find_by(token: session[:room_token])
    message = Message.create(message_params)
    message_query = message_params[:text]
    message_url_query = URI.escape(message_query)
    headers = {
      #Watson API Explorerから参照
    } 
    watsonmessage = HTTParty.get(#Watson API　Explorerからリクエスト用のURLを引っ張って来る, :headers => headers  )
    if watsonmessage["results"].present?
      watson_text = watsonmessage["results"][0]["A"]
      Message.create!(text: watson_text, admin: true, room_id: room.id)
    end
    #room.Update(room_crush_point: room.crush_point + 10)といったように返って来る発言の好感度レベルによってクラッシュポイントが増えるようにして、30までいったらゲームオーバーという仕組みにする
    redirect_to room_path

  end

  private

  def message_params
    params.require(:message).permit(:room_id, :text)
  end
end
end
