class UserAccountValidator
  attr_reader :email, :username, :name
  
  def initialize(user_hash)
    @email = user_hash[:email]
    @username = user_hash[:username]
    @name = user_hash[:name]
  end
end
