class AddCluserToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :clusher, :boolean, default: false
  end
end
