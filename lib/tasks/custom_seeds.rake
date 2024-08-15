namespace :custom_seeds do
    desc "Load the URLs seed file"
    task seed_urls: :environment do
      load Rails.root.join('db/seeds/urls.seed.rb')
      puts "URLs seed loaded!"
    end
end
