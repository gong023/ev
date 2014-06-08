require 'everlog'

class TrialWorker
  include Sidekiq::Worker
  sidekiq_options queue: :trial, retry: false

  def perform uid
    evernote = LifelogEvernote.find_by_uid uid
    twitter  = LifelogTwitter.find_by_evernote_uid uid
    hatena   = LifelogHatena.find_by_evernote_uid uid
    github   = LifelogGithub.find_by_evernote_uid uid

    everlog = Everlog::Daily.new

    begin
      everlog.push(:weather, { access_token: '41c6ad6bd5824c51' })
    rescue InfrastructureWeatherError => e
        LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'weather api error'})
    end

    unless twitter.blank?
      begin
        everlog.push(:twitter, {
          consumer_key:    'FSNYrrAMMPScdfzOo5Ge5g',
          consumer_secret: 'VRsbctmYjMVCJTX4HDPPZxNUlWXuIC6fOCeE5VjySbs',
          access_token:    twitter.access_token,
          access_secret:   twitter.access_secret
        })
      rescue Everlog::InfrastructureTwitterError => e
        LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'twitter api error'})
      end
    end

    unless hatena.blank?
      begin
        everlog.push(:hatena, {
          consumer_key:    '+44PD+AIVzFE7A==',
          consumer_secret: '1BJTt8WoOa64yy9eyC7ANkX45gI',
          access_token:    hatena.access_token,
          access_secret:   hatena.access_secret
        })
      rescue Everlog::InfrastructureHatenarError => e
        LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'hatena api error'})
      end
    end

    unless github.blank?
      begin
        everlog.push(:github, {access_secret: github.access_secret})
      rescue Everlog::InfrastructureGithubError => e
        LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'github api error'})
      end
    end

    begin
      everlog.publish('testtesttest', evernote.access_secret, 'sandbox')
    rescue Everlog::InfrastructureEvernoteError => e
        LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'evernote api error'})
    end
  end
end
