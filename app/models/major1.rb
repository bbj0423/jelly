class Major1 < ActiveRecord::Base
    # 0725 추가
    has_many :users
    has_many :admins
    #
end
