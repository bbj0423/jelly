class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception
  
  # 0806 / 추가 / 로그인하지 않으면 이용할 수 없도록 하는 코드로 현재는 주석처리
   before_action :authenticate_user! 
  # TODO: 서비스 완성시 주석풀기_김단아

end
