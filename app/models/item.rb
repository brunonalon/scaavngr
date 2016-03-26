class Item < ActiveRecord::Base
  attr_accessor :test
  belongs_to :user
  has_many :likes#, dependent: :destroy
  has_many :dislikes#, dependent: :destroy
  has_many :matches, foreign_key: "item_offered_id", dependent: :destroy
  mount_uploader :picture_url, ImageUploader
  public
  
  def self.test
    items = Item.all

    items.each{|item|
      item.remote_picture_url_url = item.url
      item.save
    }
  end
  def get_all_item_matches
    result_id = []
    item_matches = Match.where("item_offered_id = ? or item_liked_id = ?", self.id, self.id)
    item_matches.each do |item|
      if item.item_offered_id == self.id
        result_id << item.item_liked_id
      else
        result_id << item.item_offered_id
      end
    end
    Item.find(result_id)
  end
  #gets all the items that have liked this item
  def get_all_potential_trades
    result = Like.where("item_liked_id = ?", self.id).pluck(:item_offered_id)
    potential = Item.find(result)
  end
end
