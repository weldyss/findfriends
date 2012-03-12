module UsersHelper
  def nearby_friends(user)
    nearby = ""
    user.friends.each do |f|
      if GeoCoder::Calculations.distance_between(user.full_address, f.full_address) < 30
        nearby << "#{f.name} "
      end
    end
  end
end
