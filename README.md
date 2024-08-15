# URL Crawler

This Rails application provides functionality for crawling URLs to extract the HTML `<title>` tag.

## Features

- **URL Shortening and Crawling**: Generates a shortened URL, stores it, and enqueues a background job to crawl the URL and extract the title.

## Requirements

- Ruby 3.0.0 or higher
- Rails 7.x
- Redis (for Sidekiq)
- PostgreSQL or other database supported by Rails

## Setup

1. **Clone the Repository**

```
git clone https://github.com/ejaramillom/shortener.git
cd shortener 
```
   

If not using Docker, install the dependencies locally:

```
bundle install
```

Set Up the Database
```
rails db:create
rails db:migrate
rails custom_seeds:seed_urls
```

Configure Redis

Ensure Redis is running. You can use Docker for Redis:

```
docker run -d --name redis -p 6379:6379 redis
Update config/sidekiq.yml with the correct Redis URL if needed.
```

Start the Rails Server

```
rails server
Sidekiq
```

If you are using Sidekiq for background jobs, start it with:

```
bundle exec sidekiq
```

