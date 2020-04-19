class SampleJob < ApplicationJob
  queue_as :default

    # Sidekiqでは、デフォルトで最大25個のジョブを並列で実行可能
  # 使用例：翌日の正午に実行
  # SampleJob.set(wait_until: Date.tomorrow.noon).perform_later
  # 使用例：一週間後に実行
  # SampleJob.set(wait:1.week).perform_later
  def perform(*args)
    # Do something later
    Sidekiq::Logging.logger.info "サンプルジョブを実行しました"
  end
end
