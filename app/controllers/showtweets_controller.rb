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
	usernames = []
	hashtags = []
	#if params.has_key?(:hashtags)
		hashtags = params[:hashtags].split(',')
	#end
	#if params.has_key?(:usernames)
		usernames = params[:usernames].split(',')
	#end
	logger.info hashtags
	logger.info usernames
	query = ""
	logger.info "#########################"
	usernames.each do |name|
		query = "@" + name + " OR " + query
	end
	hashtags.each do |name|
		query = "#" + name + " OR " + query
		logger.info query
	end
	logger.info query
	results = Twitter.search("#{query}", :count => 4, :result_type => "recent").results
	@currenttweets = []
	results.each do |tweet|
		@currenttweets << {:user => tweet.user.screen_name, :imgurl => tweet.user.profile_image_url(size = :bigger), :text => tweet.text}
	end
	logger.info @currenttweets
	logger.info "$$$$$$$$$$$$$$$$$$$"
	logger.info @currenttweets[0][:text]
	logger.info "****************"
	end

	def update
		Twitter.configure do |config|
  		config.consumer_key = TWITTER_CONFIG['consumer_key']
  		config.consumer_secret = TWITTER_CONFIG['consumer_secret']
  		config.oauth_token = TWITTER_CONFIG['access_token']
  		config.oauth_token_secret = TWITTER_CONFIG['access_token_secret']
		end
		results = Twitter.search("to:justinbieber marry me", :count => 4, :result_type => "recent").results
		@currenttweets = []
		results.each do |tweet|
			@currenttweets << {:user => tweet.user.screen_name, :imgurl => tweet.user.profile_image_url(size = :bigger), :text => tweet.text}
		end
	end
end
