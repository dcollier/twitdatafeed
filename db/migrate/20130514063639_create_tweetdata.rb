class CreateTweetdata < ActiveRecord::Migration
  def change
    create_table :tweetdata do |t|
      t.string :author
      t.string :content
      t.timestamp :time

      t.timestamps
    end
  end
end
