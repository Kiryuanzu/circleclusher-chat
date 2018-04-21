class AddColumnToMessage < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :room, index: true, foreign_key: true
  end
end
