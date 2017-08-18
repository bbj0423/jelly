class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      # 0816 / 추가 / 메세지 기능 / 김단아
      t.integer :author_id
      t.integer :receiver_id

      t.timestamps null: false
    end
    add_index :conversations, :author_id
    add_index :conversations, :receiver_id
    add_index :conversations, [:author_id, :receiver_id], unique: true
    #
  end
end
