class RoomsController < ApplicationController
    before_action :authenticate_user!

    def index
        @room = Room.new
        @rooms_id = UserRoom.where(user_id:current_user.id)
        @rooms = Room.where(id:@rooms_id.ids)
        logger.debug('ログ入ってます')
        logger.debug(@rooms.inspect)
        logger.debug(@rooms_id.inspect)
    end

    def show
        @room = Room.find(params[:id])
    end

    def create
        @room = Room.new(rooms_params)
        if @room.save
            current_user.user_rooms.create(room_id: @room.id)
            redirect_to :action => "index"
        else
            redirect_to :action => "index"
        end
    end

    private

    def rooms_params
        params.require(:room).permit(:name)
    end
end
