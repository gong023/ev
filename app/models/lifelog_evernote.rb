class LifelogEvernote < ActiveRecord::Base
  def client
    @client ||= ::EvernoteOAuth::Client.new(token: self.access_secret, sandbox: false)
  end

  def fetch_uid
    client.user_store.getUser.id
  end
end
