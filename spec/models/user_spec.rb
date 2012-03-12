require 'spec_helper'

describe User do
  it "should have a name" do
    User.create(name: nil).should_not be_valid
  end

  it "should have friends" do
    user = User.create(name: "José")
    friend = User.create(name: "Maria")
    user.friends << friend
    user.save
    user.friends.should include(friend)
  end
end
