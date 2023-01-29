# - before_action :ensure_normal_user, only: :destroy
# + before_action :ensure_normal_user, only: %i[update destroy]


# - redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
# + redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'