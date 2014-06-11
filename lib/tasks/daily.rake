namespace :daily do
  desc 'fetch all and post evernote'

  task report: :environment do
    User.find(:all,{ conditions: { status: 2 } }).each do |u|
      DailyWorker.perform_async(u.evernote_uid)
      Worker.create({ evernote_uid: u.evernote_uid, from: 'daily' })
    end
  end
end
