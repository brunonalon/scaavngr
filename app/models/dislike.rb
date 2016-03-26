class Dislike < ActiveRecord::Base
  belongs_to :item_offered, :class_name => 'Item'
  belongs_to :item_disliked, :class_name => 'Item'
end
