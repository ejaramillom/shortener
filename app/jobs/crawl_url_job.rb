require 'net/http'
require 'uri'

class CrawlUrlJob < ApplicationJob
  queue_as :default

  def perform(url_id)
    short_url = Url.find_by_id(url_id)
    html = Net::HTTP.get_response(URI(short_url.original_url)).body
    title = Nokogiri::HTML(html).at_css('title')&.text || "No response title"
    short_url.update!(title_url: title)
  rescue => event
    Rails.logger.error("Failed to crawl title from internet URL: #{event.message}")
  end
end
