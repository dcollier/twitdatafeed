class AddTweetIdToTweetData < ActiveRecord::Migration
  def change
    add_column :tweetdata, :tweet_id, :string
  end
end
