# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session] [:email].downcase)
    if @user&.authenticate(params[:session][:password])
      # Logs in and redirects to user profile page
      if @user.activated?
        log_in @user
        # Code for the checkbox on login page to remember user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        redirect_back_or @user
      else
        # If user profile is not activated then flash warning and redirect to home
        message = 'Account not activated.'
        message += 'Check your email for the activation link.'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # Flashes an error message if password or email don't match
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
