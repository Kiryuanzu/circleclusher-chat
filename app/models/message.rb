class Message < ApplicationRecord
  belongs_to :room
  validates :text, length: { maximum: 60 }
end
