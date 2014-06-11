require 'queue/daily'

class TrialWorker
  include Sidekiq::Worker
  include Queue::Daily
  sidekiq_options queue: :trial, retry: false

  def perform uid
    post_report uid
  end
end
