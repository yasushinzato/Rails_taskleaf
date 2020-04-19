class TasksController < ApplicationController
  # フィルタでidによるTaskを共有
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    # @tasks = Task.all
    # Userテーブルと紐付けられたので、下記コードでタスク一覧を取得.ソートも追加
    # @tasks = current_user.tasks.order(created_at: :desc)
    # scopeを作成したので、スコープでソートを利用
    # @tasks = current_user.tasks.recent
    # ransackでの検索機能実装
    @q = current_user.tasks.ransack(params[:q])
    # ページネーションの追加. perスコープで表示件数を設定
    @tasks = @q.result(distinct: true).page(params[:page]).per(20)
    # ソートはView側で選択できるように実装

    # CSVファイル出力
    respond_to do |format|
      format.html
      format.csv { send_data @tasks.generate_csv, filename: "tasks-#{Time.zone.now.strftime('%Y%m%d%S')}.csv"}
    end
  end

  # CSV入力
  def import
    # 未入力の場合
    if params[:file] then
      current_user.tasks.import(params[:file])
      redirect_to tasks_url, notice: "タスクを追加しました"
    else
      redirect_to tasks_url, notice: "CSVファイルを選択してください"
    end
  end

  def show
  end

  # 確認画面
  def confirm_new
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    @task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{@task.name}」を更新しました。"
  end

  def destroy
    @task.destroy
    # Ajaxでの削除に修正. レスポンスボディなしでHTTPステータス204を返す。Ajaxリクエストの場合は特にno_contentを記述しなくてもいい
    # redirect_to tasks_url, notice: "タスク「#{@task.name}」を削除しました。"
    # head :no_content
  end

  def create
    # @task = Task.new(task_params.merge(user_id: current_user.id))
    # 上記処理でも取得できるが、モデルでUserテーブルとTaskテーブルを関連付けたので、以下のように記述もできる。
    @task = current_user.tasks.new(task_params)

    # 戻るボタンをクリックした場合
    if params[:back].present?
      render :new
      return
    end

    if @task.save
      # メールを送信する. 送信時間を遅らせるなら→のメソッドで実装、deliver_later(wait: 5.minutes)
      TaskMailer.creation_email(@task).deliver_now
      # 非同期処理のジョブを実行する
      SampleJob.perform_later
      redirect_to @task, notice: "タスク「#{@task.name}」を登録しました。"
    else
      render :new
    end
  end

  private

  # フォームから送られてきたパラメータname、descriptionだけを抜き取る
  def task_params
    params.require(:task).permit(:name, :description, :image)
  end

  def set_task
    # @task = Task.find(params[:id])
    # 他のユーザの一覧は見れないようにする。
    @task = current_user.tasks.find(params[:id])
  end

end
