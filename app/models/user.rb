class User < ActiveRecord::Base
  validates_presence_of :name

  has_many :friendships
  has_many :friends, through: :friendships

  geocoded_by :full_address

  after_validation :geocode 

  def friends_nearby
    near = []
    self.friends.each do |friend|
      if self.distance_from(friend.full_address, self.full_address) < 30
        near << friend
        return near if near.size == 3
      end
    end
  end
end
