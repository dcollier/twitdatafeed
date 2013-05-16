class AddTweetDatumToTweetQueryArgs < ActiveRecord::Migration
  def self.up
    add_column :tweetdata, :tweetqueryargs_id, :integer
  end

  def self.down
    remove_column :tweetdata, :tweetqueryargs_id, :integer
  end
end
