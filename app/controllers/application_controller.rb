# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # Sessions helper add support for login, logout and cookies
  include Pagy::Backend
  include Turbo::Redirection
  include SessionsHelper

  private

  # Used in users and microposts controllers
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url, status: :unprocessable_entity
    end
  end
end
