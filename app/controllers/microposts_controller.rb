class MicropostsController < ApplicationController
    # Logged in user method is defined in application controller
    before_action :logged_in_user, only: [:create, :destroy]

    def create
    end

    def destroy
    end
    
end
