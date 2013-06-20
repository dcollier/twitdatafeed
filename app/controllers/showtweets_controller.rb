require 'twitter'
class ShowtweetsController < ApplicationController
  def index
		
  end
 
  def show
  	logger.info params[:hashtags]
		logger.info params[:usernames]
		@tweetargs = Tweetqueryargs.where("hashtags = ? AND users = ?", params[:hashtags], params[:usernames])
		if @tweetargs.blank?
			Tweetqueryargs.create(:hashtags=>params[:hashtags], :users=>params[:usernames])
		end	
		@tweetargs = Tweetqueryargs.where("hashtags = ? AND users = ?", params[:hashtags], params[:usernames])
		logger.info @tweetargs
		logger.info TWITTER_CONFIG['consumer_key'] 
		Twitter.configure do |config|
  		config.consumer_key = TWITTER_CONFIG['consumer_key']
  		config.consumer_secret = TWITTER_CONFIG['consumer_secret']
  		config.oauth_token = TWITTER_CONFIG['access_token']
  		config.oauth_token_secret = TWITTER_CONFIG['access_token_secret']
		end
		stuff = Twitter.search("to:justinbieber marry me", :count => 3, :result_type => "recent").results.map do |status|
  		"#{status.from_user}: #{status.text}"
		end
		logger.info stuff
	end

	def update

	end
end
