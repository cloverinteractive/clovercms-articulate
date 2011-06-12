# This is a stub of an User model that has any role
# is just for testing purposes, not part of this gem

class User
  attr_reader :username, :roles

  def initialize(username=nil)
    @username = username
    @roles    = []
  end

  def has_role?(role, object=nil)
    roles.select { |user_role| user_role[:role] == role.to_s && user_role[:object] == object }.present?
  end

  def has_role!(role, object=nil)
    @roles <<  { :role => role.to_s, :object => object }
    true
  end

  def flush_roles!
    @roles = []
  end
end
