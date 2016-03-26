class Likes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :item_offered_id, :item_liked_id
      t.timestamps
    end
  end
end
