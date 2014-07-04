class WorkersController < ApplicationController
  before_filter :check_session
  skip_before_filter :verify_authenticity_token

  def create
    if ENV['HOSTNAME'] == ENV['EVERLOG_QUEUESERVER']
      TrialWorker.perform_async(params[:id])
      Worker.create({ evernote_uid: params[:id], from: 'trial' })
      render(nothing: true, status: 200) and return
    end

    Faraday.new(url: "#{ENV['EVERLOG_QUEUESERVER']}:3000").post("/workers/#{session[:uid]}")
  end

  private
  def check_session
    if ENV['HOSTNAME'] != ENV['EVERLOG_QUEUESERVER'] && session[:uid].blank?
      redirect_to '/welcome/'
    end
  end
end
