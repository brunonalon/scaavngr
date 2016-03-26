require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
     test "the truth" do
       @user1 = users(:one)
       @user2 = users(:two)
       @user3 = users(:three)
       @match1 = matches(:one)
       @match2 = matches(:two)
       puts @user1.get_all_user_conversations.inspect
     end
end
