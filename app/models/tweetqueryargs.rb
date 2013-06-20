class Tweetqueryargs < ActiveRecord::Base
  has_many :tweetdata
  attr_accessible :hashtags, :users
end
