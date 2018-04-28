class AddColumnToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :crushpoint, :integer, default: 0
  end
end
