class User < ActiveRecord::Base

  attr_accessor :ip_address

  has_many :items
  has_many :likes#, dependent: :destroy
  has_many :dislikes#, dependent: :destroy
  has_many :liked_items, through: :likes, class_name: 'Item', source: :item
  has_many :disliked_items, through: :dislikes, class_name: 'Item', source: :item
  has_many :conversations, :foreign_key => :sender_id  # has_many :sender, foreign_key: 'user_sender_id', :class_name => 'Message'
  # has_many :receiver, foreign_key: 'user_receiver_id', :class_name => 'Message'
  geocoded_by :ip_address   # can also be an IP address
  after_validation :geocode

  def self.from_omniauth(auth)
    where(uid: auth.uid).first_or_create do |user|
      user.uid      = auth.uid
      user.name     = auth.info.name
      user.email    = auth.info.email
      user.picture_profile_url = auth.info.image
      user.save
    end
  end

  def get_all_user_items
    myItems = Item.where(:user_id=>self.id)
    myItems
  end
  # Displays the conversations with the matched users
  def get_all_user_conversations
    contacts_part_one = Match.where("user_liked_id = ?", self.id).pluck(:user_offered_id)
    contacts_part_two = Match.where("user_offered_id = ?", self.id).pluck(:user_liked_id)
    a = User.find(contacts_part_one)
    b = User.find(contacts_part_two)
    c = a + b
    c
  end
  def get_nearby_items(distance)
    d = distance.to_i * 400
    items_near_me = []
    items_arr = []
    users_near_me = self.nearbys(d).shuffle
    users_near_me.each do |user|
      items_arr << Item.where('user_id = ?', user.id)
    end
    items_arr.each do |items|
      items.each do |item|
        items_near_me << item
      end
    end
    items_near_me

  end
  def get_all_messages_by_user(user)
    user1_id = self.id
    user2_id = user.id
    Message.where('(user_sender_id = ? and user_receiver_id = ?) or
    (user_sender_id = ? and user_receiver_id = ?)', user1_id,user2_id,user2_id,user1_id).order('created_at')
  end

end
