class WorkersController < ApplicationController
  before_filter :check_session

  def create
    Worker.new({evernote_uid: params[:id]}).create
  end

  private
  def check_session
    redirect_to '/welcome/' and return if session[:uid].blank?
  end
end
