class Post < ActiveRecord::Base
    mount_uploader :image, S3Uploader
    # 0725 추가
    belongs_to :user
    belongs_to :category
    
    has_many :comments
    #
    
    # 0817 추가
    #has_many :impressions, :as=>:impressionable
    is_impressionable :counter_cache => true # :column_name => :count_impressions
    
    def impression_count
      impressions.size
    end
 
    def unique_impression_count
      # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
      # so getting keys from the hash and calculating the number of keys
      impressions.group(:ip_address).size.keys.length #TESTED
    end
    # 조회수
    
    def self.search(category, search)
      if category.present?
        if search == nil
          where(category_id: category)
        else
          where('title LIKE ?', "%#{search}%").where(category_id: category)
        end
      else
        if search == nil
          where(nil)
        else
          where('title LIKE ?', "%#{search}%")
        end
      end
    end
    # 검색 기능
    
end
