class User < ActiveRecord::Base
  
  # 0725 추가
  has_many :posts
  has_many :comments
  has_many :recomments
  
  belongs_to :major1
  #
  
  # 0727 추가
    has_one :like
  #
  
  # 0816 / 추가 / 메세지 기능 / 김단아
  has_many :authored_conversations, class_name: 'Conversation', foreign_key: 'author_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'received_id'
  has_many :personal_messages, dependent: :destroy
  #
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable # 0806 / 추가 / 김단아
end
