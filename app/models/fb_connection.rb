class FbConnection < ActiveRecord::Base
  attr_accessible :friend_fbid, :user_fbid
end
