require 'everlog'

class EventWorker
  include Sidekiq::Worker
  sidekiq_options queue: :event, retry: false

  def perform uid
    evernote = LifelogEvernote.find_by_uid uid
    twitter  = LifelogTwitter.find_by_evernote_uid uid
    hatena   = LifelogHatena.find_by_evernote_uid uid
    github   = LifelogGithub.find_by_evernote_uid uid

    everlog = Everlog.new
    unless twitter.blank?
      everlog.push(:twitter, {
        consumer_key:    'FSNYrrAMMPScdfzOo5Ge5g',
        consumer_secret: 'VRsbctmYjMVCJTX4HDPPZxNUlWXuIC6fOCeE5VjySbs',
        access_token:    twitter.access_token,
        access_secret:   twitter.access_secret
      })
    end

    unless hatena.blank?
      everlog.push(:hatena, {
        consumer_key:    '+44PD+AIVzFE7A==',
        consumer_secret: '1BJTt8WoOa64yy9eyC7ANkX45gI',
        access_token:    hatena.access_token,
        access_secret:   hatena.access_secret
      })
    end

    unless github.blank?
      everlog.push(:github, {
        access_secret: github.access_secret
      })
    end

    everlog.publish('testtesttest', evernote.access_secret)
  end
end
