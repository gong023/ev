class WelcomeController < ApplicationController
  def index
    redirect_to "/users/#{session[:uid]}/edit" and return unless session[:uid].blank?
  end
end
