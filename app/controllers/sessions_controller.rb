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
      when 'moves'
        create_moves result
    end

    redirect_to controller: 'users', action: 'edit', id: session[:uid]
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
    if LifelogTwitter.find_by_evernote_uid(session[:uid]).blank?
      LifelogTwitter.create(evernote_uid: session[:uid], access_token: credentials[:token], access_secret: credentials[:secret])
    end
  end

  def create_hatena result
    credentials = result[:credentials]
    lifelog_hatena = LifelogHatena.find_by_evernote_uid(session[:uid])
    if lifelog_hatena.blank?
      LifelogHatena.create(evernote_uid: session[:uid], access_token: credentials[:token], access_secret: credentials[:secret])
    elsif lifelog_hatena.status == 2
      lifelog_hatena.update(access_token: credentials[:token], access_secret: credentials[:secret], status: 1)
    end
  end

  def create_github result
    credentials = result[:credentials]
    if LifelogGithub.find_by_evernote_uid(session[:uid]).blank?
      LifelogGithub.create(evernote_uid: session[:uid], access_secret: credentials[:token])
    end
  end

  def create_moves result
    credentials = result[:credentials]
    lifelog_moves = LifelogMoves.find_by_evernote_uid(session[:uid])
    if lifelog_moves.blank?
      LifelogMoves.create(evernote_uid: session[:uid], access_secret: credentials[:token])
    elsif lifelog_moves.status == 2
      lifelog_moves.update(access_secret: credentials[:token], status: 1)
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
