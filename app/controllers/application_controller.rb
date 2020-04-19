class ApplicationController < ActionController::Base
  # 全てのビューで使えるようにする
  helper_method :current_user
  # ログインしていないと機能が遣えないようにするフィルタ。
  before_action :login_required

  private

  # ログイン情報を取得.全てのコントローラーで利用可能
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # 未ログインのときはログインページを表示。ログイン画面でのフィルタは利用しないため、session_controllerに定義
  def login_required
    redirect_to login_path unless current_user
  end

end
