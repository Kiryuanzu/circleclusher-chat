class AddKakoiRoomidToMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :kakoi_room, index: true, foreign_key: true
  end
end
