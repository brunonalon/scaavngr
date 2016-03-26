class SwipeController < ApplicationController
  def findstuff
    @items = current_user.get_all_user_items
    @otheritems = Item.all - current_user.get_all_user_items
  end
end
