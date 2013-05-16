class Tweetdatum < ActiveRecord::Base
  belongs_to: tweetqueryargs
  attr_accessible :author, :content, :time
end
