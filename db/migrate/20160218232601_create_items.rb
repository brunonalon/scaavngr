class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, :picture_url, :description, :url
      t.integer :user_id
      t.timestamps
    end
  end
end
