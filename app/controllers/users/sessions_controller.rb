class Users::SessionsController < Devise::SessionsController
  before_action :reject_user, only: :create
  
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
protected

  def reject_user
    user = User.find_by(email: params[:user][:email].downcase)
    if user
      if (user.active_for_authentication? == false) && !(user.valid_password?(params[:user][:password]))
        redirect_to new_user_session_path
      end
    end
  end
end