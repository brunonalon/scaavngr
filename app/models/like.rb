class Like < ActiveRecord::Base
  belongs_to :item_offered, :class_name => 'Item'
  belongs_to :item_liked, :class_name => 'Item'
  after_save :check_matches

  def check_matches
    #search likes for inverse of item ids
    result = Like.where(:item_offered=>self.item_liked).where(:item_liked=>self.item_offered)
    #if results > 0, then insert a match in the matches table
    Match.create(item_offered: self.item_offered, item_liked: self.item_liked, user_offered: self.item_offered.user, user_liked: self.item_liked.user) if result.length > 0
  end
end
