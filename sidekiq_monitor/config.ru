require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://gong023.com:6379', namespace: "sidekiq_development", size: 1 }
end

require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == 'lifelogsidekiq' && password == 'bakasinegenkika'
end

run Sidekiq::Web
