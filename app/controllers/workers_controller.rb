class WorkersController < ApplicationController
  before_filter :check_session

  def create
    EventWorker.perform_async(params[:id])
    Worker.create({ evernote_uid: params[:id] })
  end

  private
  def check_session
    redirect_to '/welcome/' and return if session[:uid].blank?
  end
end
