class EventWorker
  include Sidekiq::Worker
  sidekiq_options queue: :event

  def perform
    puts 'ooooooooooooooooooooooookkkkkkkkkkkkkkkkkkkkk'
  end
end
