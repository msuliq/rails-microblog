# frozen_string_literal: true

class UsersController < ApplicationController
  # Logged in user is defined in application controller
  before_action :logged_in_user,  only: %i[index edit update
                                           destroy following followers]
  before_action :correct_user,    only: %i[edit update]
  before_action :admin_user,      only: :destroy

  def new
    @user = User.new
  end

  def index
    @pagy, @users = pagy(User.where(activated: true))
  end

  def show
    @user = User.find(params[:id])
    @pagy, @microposts = pagy(@user.microposts)
    redirect_to(root_url) unless @user.activated?
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # defined in user model
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to root_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Process successful update
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to users_url, status: 303
  end

  def following
    @title = 'Following'
    @user = User.find(params[:id])
    @pagy, @users = pagy(@user.following)
    render 'show_follow'
  end

  def followers
    @title = 'Followers'
    @user = User.find(params[:id])
    @pagy, @users = pagy(@user.followers)
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Verifies user's rights
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Verifies admin user rights
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
