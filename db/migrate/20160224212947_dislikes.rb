class Dislikes < ActiveRecord::Migration
  def change
    create_table :dislikes do |t|
      t.integer :item_offered_id, :item_disliked_id
      t.timestamps
    end
  end
end
