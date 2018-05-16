class CreateKakoiRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :kakoi_rooms do |t|
      t.string "token"
      t.integer "kakoipoint", default: 0
      t.index ["token"], name: "index_kakoi_rooms_on_token"
      t.timestamps
    end
  end
end
