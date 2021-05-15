class MainController < ApplicationController
    def index
        flash[:notice] = "Logged in sucesfully"
        flash[:alert] = "Invalid email or password"
    end
end