class Room < ActiveRecord::Base
  validates :name,  presence: true
  validates :token, presence: true, uniqueness: true

  before_validation :fill_token

  private

  def fill_token
    self.token ||= SecureRandom.hex
  end
end
