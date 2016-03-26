require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Match Created!" do
    @user1 = users(:one)
    @user2 = users(:two)
    nearyby = @user1.nearbys(1);
    puts nearyby.inspect
    puts @user1.distance_from(@user2)
  end
end
