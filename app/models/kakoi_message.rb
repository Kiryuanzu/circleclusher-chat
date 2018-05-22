class KakoiMessage < ApplicationRecord
  belongs_to :kakoi_room
  validates :text, length: { maximum: 60 }
end
