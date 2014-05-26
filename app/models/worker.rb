class Worker < ActiveRecord::Base
  def create
    evernote = LifelogEvernote.find_by_uid self.evernote_uid
    twitter  = LifelogTwitter.find_by_evernote_uid self.evernote_uid
    hatena   = LifelogHatena.find_by_evernote_uid self.evernote_uid
    github   = LifelogGithub.find_by_evernote_uid self.evernote_uid
    self.save
  end
end
