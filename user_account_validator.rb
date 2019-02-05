class  EmailError < StandardError
end

class UserAccountValidator
  attr_reader :email, :username, :name

  def initialize(user_hash)
    @email = user_hash[:email]
    @username = user_hash[:username]
    @name = user_hash[:name]
  end

  def validate
    validate_email
    validate_username
  end

  def validate_email
    raise EmailError unless @email &.include?("@")
  end

  def validate_username
    raise "Username is missing!" unless @username
  end
end
