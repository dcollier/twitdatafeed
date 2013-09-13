require 'twitter'
class ShowtweetsController < ApplicationController
  def index
		
  end
 
  def show
  	logger.info params[:hashtags]
	logger.info params[:usernames]
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
	@query = ""
	logger.info "#########################"
	usernames.each do |name|
		@query = "%40" + name + "&nbsp;OR&nbsp;" + @query
	end
	hashtags.each do |name|
		@query = "%23" + name + "&nbsp;OR&nbsp;" + @query
		logger.info @query
	end
	logger.info @query
  end

  def update
	@query = params[:query]
	logger.info "###################"
	logger.info @query
	logger.info "####################"
	if @query == ""
	   render :nothing => true
	   return
	end
	logger.info TWITTER_CONFIG['consumer_key'] 
	Twitter.configure do |config|
	  
	config.consumer_key = TWITTER_CONFIG['consumer_key']
	config.consumer_secret = TWITTER_CONFIG['consumer_secret']
	config.oauth_token = TWITTER_CONFIG['access_token']
	config.oauth_token_secret = TWITTER_CONFIG['access_token_secret']
	config.connection_options = Twitter::Default::CONNECTION_OPTIONS.merge(:request => { 
	  :open_timeout => 10,
	  :timeout => 15
	})
	end
	results = Twitter.search("#{@query}", :count => 4, :result_type => "recent").results
	@currenttweets = []
	results.each do |tweet|
		@currenttweets << {:user => tweet.user.screen_name, :imgurl => tweet.user.profile_image_url(size = :bigger), :text => tweet.text}
	end
	logger.info @currenttweets
	logger.info "$$$$$$$$$$$$$$$$$$$"
	logger.info "****************"
	respond_to do |format|
	  format.js { render :action => 'update' }
	end
    end
end
