namespace :test do
  desc 'test by myself'

  task myself: :environment do
    DailyWorker.perform_async(3414606)
  end
end
