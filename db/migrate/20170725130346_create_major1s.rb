class CreateMajor1s < ActiveRecord::Migration
  def change
    create_table :major1s do |t|
      
      # 0725 추가
      t.string :name
      #

      t.timestamps null: false
    end
  end
end
