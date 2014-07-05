Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.logger = Rails.logger

  provider :twitter, ENV['EVERLOG_TWITTER_CONSUMERKEY'], ENV['EVERLOG_TWITTER_CONSUMERSEC']
  provider :hatena, ENV['EVERLOG_HATENA_CONSUMERKEY'], ENV['EVERLOG_HATENA_CONSUMERSEC']
  provider :github, ENV['EVERLOG_GITHUB_CONSUMER_KEY'], ENV['EVERLOG_GITHUB_CONSUMER_SEC']
  provider :moves, ENV['EVERLOG_MOVES_CONSUMER_KEY'], ENV['EVERLOG_MOVES_CONSUMER_SEC']

  site_option = ENV['RAILS_ENV'].blank? ? 'https://sandbox.evernote.com' : 'https://evernote.com'
  provider :evernote, ENV['EVERLOG_EVERNOTE_KEY'], ENV['EVERLOG_EVERNOTE_SEC'], client_options: { site: site_option }
end
