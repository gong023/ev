class WorkersController < ApplicationController
  before_filter :check_session

  def create
    params[:id]
  end

  private
  def check_session
    redirect_to '/welcome/' and return if session[:uid].blank?
  end
end
