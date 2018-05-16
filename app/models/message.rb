class Message < ApplicationRecord
  belongs_to :room 
  belongs_to :kakoi_room
end
