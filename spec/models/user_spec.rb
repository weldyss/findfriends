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

  it "should be findable" do
    user = User.create(name: "Silva", full_address: "1500 Sugar Bowl Dr, New Orleans, LA 70112, USA")
    user.latitude.should == 29.952211
    user.longitude.should == -90.080563
  end

  it "should be friends nearby" do
    pending "preciso chamar externamente o Calculations do Geocoder."
    user = User.create(name: "Weldys", full_address: "Avenida Jeronimo de Albuquerque, Sao Luis, MA, Brazil")
    friend1 = User.create(name: "Amigo", full_address: "Avenida Daniel de La Touche, Sao Luis, MA, Brazil")
    friend2 = User.create(name: "Amigo longe", full_address: "1500 Sugar Bowl Dr, New Orleans, LA 70112, USA")
    user.friends << [friend1, friend2]
    user.save
    user.friends_nearby.should include(friend1)
    user.friends_nearby.should_not include(friend2)
  end
end
