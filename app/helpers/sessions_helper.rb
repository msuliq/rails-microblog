module SessionsHelper
    #login for user
    def log_in(user)
        session[:user_id] = user.id
    end

    #return current logged in user if user exists
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    #return true if user signed up or false
    def logged_in?
        !current_user.nil?
    end
end
