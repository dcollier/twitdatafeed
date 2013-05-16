class CreateTweetqueryargs < ActiveRecord::Migration
  def change
    create_table :tweetqueryargs do |t|
      t.string :hashtags
      t.string :users

      t.timestamps
    end
  end
end
