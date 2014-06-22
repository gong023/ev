require 'everlog'

class Queue
  module Daily
    def post_report uid
      evernote  = LifelogEvernote.find_by_uid uid

      everlog = Everlog::Daily.new

      begin
        everlog.push(:weather, { access_token: '41c6ad6bd5824c51' })
      rescue InfrastructureWeatherError => e
        LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'weather api error'})
      end

      twitter = LifelogTwitter.find_by_evernote_uid uid
      unless twitter.blank?
        begin
          everlog.push(:twitter, {
            consumer_key:    'HOsdFThXCsI7EjVC6gRzgWDgd',
            consumer_secret: 'fLOy5pLsIIzE40A7lS59N0fM7L7laJtmSXiJYW2ky4MN1AoJlE',
            access_token:    twitter.access_token,
            access_secret:   twitter.access_secret
          })
        rescue Everlog::InfrastructureTwitterError => e
          LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'twitter api error'})
        end
      end

      hatena = LifelogHatena.find_by_evernote_uid uid
      unless hatena.blank?
        begin
          everlog.push(:hatena, {
            consumer_key:    '0/xho8PM2xdqdg==',
            consumer_secret: 'AnK35xT6qTdue1S3sEVrVRgfQ9w=',
            access_token:    hatena.access_token,
            access_secret:   hatena.access_secret
          })
        rescue Everlog::InfrastructureHatenarError => e
          hatena.update(status: 2)
          LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'hatena api error'})
        end
      end

      github = LifelogGithub.find_by_evernote_uid uid
      unless github.blank?
        begin
          everlog.push(:github, {access_secret: github.access_secret})
        rescue Everlog::InfrastructureGithubError => e
          LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'github api error'})
        end
      end

      animetick = LifelogAnimetick.find_by_evernote_uid uid
      unless animetick.blank?
        begin
          everlog.push(:animetick, {
            access_token: animetick.access_token,
            access_secret: animetick.access_secret
          })
        rescue Everlog::InfrastructureEvernoteError => e
          LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'animetick error'})
        end
      end

      moves = LifelogMoves.find_by_evernote_uid uid
      unless moves.blank?
        begin
          everlog.push(:moves, {access_secret: moves.access_secret})
        rescue Everlog::InfrastructureMovesError => e
          LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'moves api error'})
        end
      end

      begin
        everlog.publish(title, evernote.access_secret, 'production')
      rescue Everlog::InfrastructureEvernoteError => e
        LifelogLogger.create({evernote_uid: uid, text: e.message, occured: 'evernote api error'})
      end
    end

    def title
      d = (Date.today - 1)
      case d.wday
      when 0
        wday = 'Sun'
      when 1
        wday = 'Mon'
      when 2
        wday = 'Tue'
      when 3
        wday = 'Wed'
      when 4
        wday = 'Thu'
      when 5
        wday = 'Fri'
      when 6
        wday = 'Sat'
      end

      "Lifelog #{d.to_s.gsub(/-/, '/')}(#{wday})"
    end
  end
end
