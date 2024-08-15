class Url < ApplicationRecord
  before_create :shorten
  after_create_commit :enqueue_crawl_job

  validates :original_url, presence: true

  scope :by_counter, -> { order(counter: :desc).first(100) }

  def increase_counter
    self.counter = self.counter + 1
  end

  private

  def shorten
    self.shortened_url = SecureRandom.urlsafe_base64(5)
  end

  def enqueue_crawl_job
    CrawlUrlJob.perform_later(self.id)
  end
end
