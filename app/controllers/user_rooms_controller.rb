class UserRoomsController < ApplicationController
    def create
        @userroom = UserRoom.new
    end
end
