class AddKakoiRoomidToKakoiMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference :kakoi_messages, :kakoi_room, index: true, foreign_key: true
  end
end
