# frozen_string_literal: true

class PasswordResetsController < ApplicationController
  before_action :get_user,          only: %i[edit update]
  before_action :valid_user,        only: %i[edit update]
  before_action :check_expiration,  only: %i[edit update]

  def new; end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = 'Email sent with password reset instructions'
      redirect_to root_url
    else
      flash.now[:danger] = 'Email address not found'
      render 'new', status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if password_blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit', status: :unprocessable_entity
    elsif @user.update(user_params)
      log_in @user
      flash[:success] = 'Password has been reset.'
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  # Returns true is password is blank
  def password_blank?
    params[:user][:password].blank?
  end

  # Before action filters
  def get_user
    @user = User.find_by(email: params[:email])
  end

  # Validates user
  def valid_user
    redirect_to root_url unless @user&.activated? && @user&.authenticated?(:reset, params[:id])
  end

  # Checks token expiration time
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = 'Password reset has expired.'
      redirect_to new_password_reset_url
    end
  end
end
