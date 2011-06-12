# This is a stub of an User model that has any role
# is just for testing purposes, not part of this gem

class User < Struct.new( :username )
  def has_role?(role, object)
    true
  end
end
