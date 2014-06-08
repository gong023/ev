class UsersController < ApplicationController
  before_filter :check_session

  # GET /users/1/edit
  def edit
    set_service params[:id]
  end

  # PATCH/PUT /users/1
  def update
    case(params[:key])
      when 'status'
        User.find_by_evernote_uid(session[:uid]).update_attributes(status: params[:val])
    end

    set_service params[:id]
    render action: :edit
  end

  private
  def check_session
    redirect_to '/welcome/' and return if session[:uid].blank?
  end

  def set_service uid
    @ua = AgentOrange::UserAgent.new(request.env["HTTP_USER_AGENT"])
    @twitter = LifelogTwitter.find_by_evernote_uid(uid)
    @hatena  = LifelogHatena.find_by_evernote_uid(uid)
    @github  = LifelogGithub.find_by_evernote_uid(uid)
    @moves   = LifelogMoves.find_by_evernote_uid(uid)
  end
end
