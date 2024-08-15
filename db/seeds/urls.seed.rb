puts 'Data seed in progress...'

ActiveRecord::Base.transaction do
  Url.destroy_all
  150.times do |integer|
    Url.create!([
      original_url: Faker::Internet.url,
      shortened_url: SecureRandom.urlsafe_base64(5),
      title_url: Faker::Lorem.sentence,
      counter: Faker::Number.between(from: 0, to: 20)
    ])
  end
end

puts 'Data seed finished...'
