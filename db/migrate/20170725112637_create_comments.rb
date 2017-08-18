class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      # 0725 추가
      t.integer :user_id
      t.integer :post_id
      t.text :content
      #
      
      t.timestamps null: false
    end
  end
end
