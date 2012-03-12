class User < ActiveRecord::Base
  validates_presence_of :name

  has_many :friendships
  has_many :friends, through: :friendships

  geocoded_by :full_address

  after_validation :geocode 

  def friends_nearby
    near = []
    self.friends.each do |friend|
      if User.distance_between(friend.full_address, self.full_address) < 30
        near << friend
      end
    end
  end
end
