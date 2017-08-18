class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      
      # 0725 추가
      t.string :name
      #

      t.timestamps null: false
    end
  end
end
