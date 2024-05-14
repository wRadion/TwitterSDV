class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to root_path
    else
      flash[:errors] = @tweet.errors
      redirect_to new_tweet_path
    end
  end

  def destroy
  end

  private

    def tweet_params
      p = params.require(:tweet).permit(:content)
      p[:user_id] = session[:user_id]
      p
    end
end
