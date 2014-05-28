Sidekiq.configure_server do |config|
  env = ENV['RAILS_ENV'] ? ENV['RAILS_ENV'] : 'development'
  config.redis = { url: 'redis://gong023.com:6379', namespace: "sidekiq_#{env}" }

  database_url = ENV['DATABASE_URL']
  if database_url
    ENV['DATABASE_URL'] = "#{database_url}?pool=25"
    ActiveRecord::Base.establish_connection
  end
end

Sidekiq.configure_client do |config|
  env = ENV['RAILS_ENV'] ? ENV['RAILS_ENV'] : 'development'
  config.redis = { url: 'redis://gong023.com:6379', namespace: "sidekiq_#{env}" }

  database_url = ENV['DATABASE_URL']
  if database_url
    ENV['DATABASE_URL'] = "#{database_url}?pool=25"
    ActiveRecord::Base.establish_connection
  end
end
