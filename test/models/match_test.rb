require 'test_helper'

class MatchTest < ActiveSupport::TestCase
  test "Match Created!" do
    puts "---------USERS-----------"
    @user1 = users(:one)
    @user2 = users(:two)
    @user3 = users(:three)
    puts @user1.inspect
    puts @user2.inspect
    puts @user3.inspect
    puts "---------ITEMS-----------"
    @item1 = items(:one)
    @item2 = items(:two)
    @item3 = items(:three)
    # @item1.user_id = @user1.id
    # @item2.user_id = @user2.id
    puts @item1.inspect
    puts @item2.inspect
    puts @item3.inspect
    puts "---------LIKES-----------"
    @like1 = Like.create(item_offered: @item1, item_liked: @item2)
    @like2 = Like.create(item_offered: @item2, item_liked: @item1)
    @like3 = Like.create(item_offered: @item3, item_liked: @item1)
    puts @like1.inspect
    puts @like2.inspect
    puts @like3.inspect
    @match = Match.where(item_offered: @item2, item_liked: @item1).first
    puts @match.inspect
    puts "get_all_item_matches"
    puts @item1.get_all_item_matches.inspect
    puts '----------'
    puts "get_all_user_items"
    puts @user1.get_all_user_items.inspect
    puts "-------"
    puts 'get_all_potential_trades'
    puts @item1.get_all_potential_trades.inspect
    puts '-------'
    assert_equal(@user1.get_all_user_items.first.user_id, 1)
    assert_equal(@item2.id, @match.item_offered_id, 'match exists')
    assert_equal(@item1.id, @match.item_liked_id, 'match exists')
  end
end
