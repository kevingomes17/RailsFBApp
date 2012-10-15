class FbUser < ActiveRecord::Base
  attr_accessible :email, :fbid, :name, :phone
end
