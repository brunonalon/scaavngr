require 'test_helper'

class ConversationsControllerTest < ActionController::TestCase

  def setup
    session[:user_id] = users(:one).id
  end
   test "conversations can only exist between matches" do
     @user1 = users(:one)
     @user2 = users(:two)
     @user3 = users(:three)
     @match = matches.
     puts session[:user_id]
   end
end
