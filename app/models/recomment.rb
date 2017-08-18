class Recomment < ActiveRecord::Base
    
  # 0725 추가
  belongs_to :comment
  belongs_to :user
  #
    
end
