FactoryBot.define do
  factory :task do
    name { 'テストを書く' }
    description { 'RSpec & Capybara & FactoryBotを準備する' }
    # factoryメソッドで定義されているUserクラスを利用する。
    # 関連名とファクトリ名が異なる場合はusers.rbに記述しているファクトリ名を確認して、以下の記述もできる。
    # association :user, factory: :admin_user
    user

  end
end
