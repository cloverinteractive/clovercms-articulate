# This is a stub of an User model that has any role
# is just for testing purposes, not part of this gem

class User < ActiveRecord::Base
  acts_as_authorization_subject :association_name => :roles
  has_many :articles
end
