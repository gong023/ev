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

      p "#{t.evernote_uid} / #{client.user.screen_name}"
    end
  end

  task github: :environment do
    p '====github===='
    require 'octokit'
    LifelogGithub.all.each do |g|
      client = Octokit::Client.new(access_token: g.access_secret)
      p "#{g.evernote_uid} / #{client.user.name}"
    end
  end

  task hatena: environment do
    p '====hatena===='
    require 'hatena-bookmark'
    LifelogHatena.all.each do |h|
      client ||= ::Hatena::Bookmark.new(
        consumer_key:    '0/xho8PM2xdqdg==',
        consumer_secret: 'AnK35xT6qTdue1S3sEVrVRgfQ9w=',
        request_token:   h.access_token,
        request_secret:  h.access_secret
      )

      p "#{h.evernote_ui} / #{client.feed['feed']['title']}"
    end
  end
end
