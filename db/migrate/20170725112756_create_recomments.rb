class CreateRecomments < ActiveRecord::Migration
  def change
    create_table :recomments do |t|
      
      # 0725 추가
      t.text :content
      t.integer :user_id
      t.integer :comment_id
      #

      t.timestamps null: false
    end
  end
end
