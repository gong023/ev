namespace :detect do
  desc 'user info detect'

  task twitter: :environment do
    p '====twitter===='
    require 'twitter'
    LifelogTwitter.all.each do |t|
      client = ::Twitter::REST::Client.new do |c|
        c.consumer_key        = 'HOsdFThXCsI7EjVC6gRzgWDgd'
        c.consumer_secret     = 'fLOy5pLsIIzE40A7lS59N0fM7L7laJtmSXiJYW2ky4MN1AoJlE'
        c.access_token        = t.access_token
        c.access_token_secret = t.access_secret
      end

      p client.user.screen_name
    end
  end
end
