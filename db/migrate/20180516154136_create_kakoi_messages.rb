class CreateKakoiMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :kakoi_messages do |t|
      t.text "text"
      t.boolean "kakoi", default: false
      t.timestamps
    end
  end
end
