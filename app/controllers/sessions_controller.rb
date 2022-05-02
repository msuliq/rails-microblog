class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: params[:session] [:email].downcase)
    if user && user.authenticate(params[:session][:password])
    #login and redirect to user profile page
    else
     #flash anerror message
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
    end
  end

  def destroy
  end

end