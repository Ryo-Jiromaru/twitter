class TweetsController < ApplicationController

    before_action :authenticate_user!

    def index
      #書き換える部分ここから
      if params[:search] == nil
        @tweets= Tweet.all
      elsif params[:search] == ''
        @tweets= Tweet.all
      else
        #部分検索
        search = params[:search]
        @tweets = Tweet.joins(:user).where("body LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%")
      end
    end 

    def new
        @tweet = Tweet.new
    end

    def show
        @tweet = Tweet.show
    end 

    def create
        @tweet = Tweet.new(tweet_params)
        @tweet.user_id = current_user.id
        if @tweet.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    private

    def tweet_params
        params.require(:tweet).permit(:address, :latitude, :longitude)
    end
end
