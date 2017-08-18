class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      # 0725 추가
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :category_id
      t.integer :impressions_count
      t.boolean :notice, default: false
      t.integer :major_id
      t.string :image
      t.string :doc
      #
      
      t.timestamps null: false
    end
  end
end
