class ApplicationMailer < ActionMailer::Base
  default from: "lmvicky@likelion.org" # 0806 / 수정
  # TODO: 실제 서비스 시 이 부분 주소 바꾸기_김단아
  layout 'mailer'
end
