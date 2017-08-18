class Comment < ActiveRecord::Base
    # 0725 추가
    belongs_to :post
    belongs_to :user
    
    #has_many :recomments
    #
end
