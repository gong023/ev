class SessionsController < ApplicationController

  def create
    result = request.env['omniauth.auth']
    case(result[:provider])
      when 'evernote'
        create_evernote result
      when 'twitter'
        create_twitter result
      when 'hatena'
        create_hatena result
      when 'github'
        create_github result
    end

    redirect_to controller: 'users', action: 'index'
  end

  def create_evernote result
    access_secret = result[:credentials][:token]
    evernote_uid = LifelogEvernote.new(access_secret: access_secret).fetch_uid
    if User.find_by_evernote_uid(evernote_uid).blank?
      LifelogEvernote.create(uid: evernote_uid, access_secret: access_secret)
      User.create(evernote_uid: evernote_uid)
    end
    session[:uid] = evernote_uid
  end

  def create_twitter result
    credentials = result[:credentials]
    if Ltwitter.find_by_evernote_uid(session[:uid]).blank?
      Ltwitter.create(evernote_uid: session[:uid], access_token: credentials[:token], access_secret: credentials[:secret])
    end
  end

  def create_hatena result
    credentials = result[:credentials]
    if Lhatena.find_by_evernote_uid(session[:uid]).blank?
      Lhatena.create(evernote_uid: session[:uid], access_token: credentials[:token], access_secret: credentials[:secret])
    end
  end

  def create_github result
    credentials = result[:credentials]
    if Github.find_by_evernote_uid(session[:uid]).blank?
      Github.create(evernote_uid: session[:uid], access_secret: credentials[:token])
    end
  end

  # メタいことをするのならこんなので動きそう
  def create_service target, result, have_token
    credentials  = result[:credentials]
    if target.send(:find_by_evernote_uid, session[:uid]).blank?
      if have_token
        target.send(:create, evernote_uid: session[:uid], access_token: credentials[:token], access_secret: credentials[:token])
      else
        target.send(:create, evernote_uid: session[:uid], access_secret: credentials[:token])
      end
    end
  end
end
