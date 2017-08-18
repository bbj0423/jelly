# 이메일 인증 후 경로 설정 / 0806 / 김단아
class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    # 내가 원하는 경로
    root_path
    # TODO: 나중에 변경 요함_김단아
  end
end