class Room < ActiveRecord::Base
  validates :token, presence: true, uniqueness: true
  validates :timer, presence: true, format: {with: /\A\d+:\d+\z/}

  before_validation :fill_token

  def attrs
    self.attributes.merge(
      timer_sec: timer_sec,
      countdown_sec: countdown_sec
    )
  end

  def timer_sec
    if timer
      m, s = timer.split(':', 2).map(&:to_i)
      m * 60 + s
    end
  end

  def countdown_sec
    if started_at
      timer_sec - (Time.now - started_at).to_i
    end
  end

  def start!
    self.started_at = Time.now
    self.save!
  rescue => e
    self.started_at = nil
    raise e
  end

  def stop!
    self.started_at = nil
    self.save!
  end

  def to_param
    token
  end

  private

  def fill_token
    self.token ||= SecureRandom.hex
  end
end
