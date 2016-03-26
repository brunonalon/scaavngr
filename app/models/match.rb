class Match < ActiveRecord::Base
  belongs_to :user_offered, :class_name => 'User'
  belongs_to :user_liked, :class_name => 'User'
  belongs_to :item_offered, :class_name => 'Item'
  belongs_to :item_liked, :class_name => 'Item'
end
