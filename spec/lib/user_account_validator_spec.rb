require "spec_helper"

RSpec.describe UserAccountValidator do
  # UserAccountValidator should be an instance of UserAccountValidator
  # UserAccountValidator should take in a hash to its constructor
  # UserAccountValidator should include values of email, username, name assigned from the hash
  # UserAccountValidator should raise an EmailError if email is missing or does not contain "@"
  # UserAccountValidator should raise an error if username is missing

  user_hash = {
    email: "doc@d7miners.com",
    username: "doc",
    name: "Doc"
  }
  user_validator = UserAccountValidator.new(user_hash)

  it "should be an instance of UserAccountValidator" do
    expect(user_validator).to be_an_instance_of(UserAccountValidator)
  end

  it "should include values assigned from the hash" do
    expect(user_validator.email).to eq(user_hash[:email])
    expect(user_validator.username).to eq(user_hash[:username])
    expect(user_validator.name).to eq(user_hash[:name])
  end

  it "should raise an EmailError if it is missing an email or username" do
    user_error_1 = UserAccountValidator.new({email: nil, username: "doc", name: "Doc"})
    expect { user_error_1.validate_email }.to raise_error(EmailError)
    user_error_2 = UserAccountValidator.new({email: "nil.gmail.com", username: "doc", name: "Doc"})
    expect { user_error_2.validate_email }.to raise_error(EmailError)
  end

  it "should raise an error if email is missing '@'" do
    user_error_1 = UserAccountValidator.new({email: "doc@d7miners.com", username: nil, name: "Doc"})
    expect { user_error_1.validate_username }.to raise_error("Username is missing!")
  end
end
