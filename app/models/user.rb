class User < ActiveRecord::Base
  validates_presence_of :name

  has_many :friendships
  has_many :friends, through: :friendships

  geocoded_by :full_address

  after_validation :geocode 

  def friends_nearby
    near = []
    self.friends.each do |friend|
      if self.distance_from(friend) < 20
        near << friend
      end
    end
    near
  end
end
