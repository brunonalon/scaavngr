class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :item_offered_id, :item_liked_id, :user_offered_id, :user_liked_id
      t.timestamps
    end
  end
end
