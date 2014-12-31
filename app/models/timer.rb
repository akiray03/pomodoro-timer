class Timer < ActiveRecord::Base
  belongs_to :room

  validates :room_id, presence: true
  validates :timer,   presence: true
end
