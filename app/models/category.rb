class Category < ActiveRecord::Base
    
  # 0725 추가
  has_many :posts
  #
    
end
