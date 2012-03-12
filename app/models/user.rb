class User < ActiveRecord::Base
  validates_presence_of :name

  has_many :friendships
  has_many :friends, through: :friendships
end
