class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      # 0725 추가
      t.integer :user_id
      #
      t.timestamps null: false
    end
  end
end
