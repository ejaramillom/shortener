class Url < ApplicationRecord
  before_create :shorten

  validates :original_url, presence: true

  scope :by_counter, -> { order(counter: :asc).first(100) }

  def increase_counter
    self.counter = self.counter + 1
  end

  private

  def shorten
    self.shortened_url = SecureRandom.urlsafe_base64(5)
  end
end
