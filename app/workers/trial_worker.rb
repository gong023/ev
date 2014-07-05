require 'queue/daily'

class TrialWorker
  include Sidekiq::Worker
  include Queue::Daily
  sidekiq_options queue: :trial, retry: true

  def perform uid
    post_report uid
  end
end
