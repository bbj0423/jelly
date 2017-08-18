class PersonalMessage < ActiveRecord::Base
  # 0816 / 추가 / 메세지 기능 / 김단아
  belongs_to :conversation
  belongs_to :user
  
  validates :body, presence: true
  
end
