require 'queue/daily'

class DailyWorker
  include Sidekiq::Worker
  include Queue::Daily
  sidekiq_options queue: :daily, retry: true

  def perform uid
    post_report uid
  end
end
