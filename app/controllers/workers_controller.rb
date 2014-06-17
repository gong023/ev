class WorkersController < ApplicationController
  before_filter :check_session
  skip_before_filter :verify_authenticity_token

  def create
    if ENV['HOSTNAME'] == 'gong023.com'
      TrialWorker.perform_async(params[:id])
      Worker.create({ evernote_uid: params[:id], from: 'trial' })
      render(nothing: true, status: 200) and return
    end

    Faraday.new(url: 'http://gong023.com:3000').post("/workers/#{session[:uid]}")
  end

  private
  def check_session
    if ENV['HOSTNAME'] != 'gong023.com' && session[:uid].blank?
      redirect_to '/welcome/'
    end
  end
end
