# テスト用データ
FactoryBot.define do
# factoryメソッドを利用して、:user という名前のUserクラスのファクトリを定義。taskクラスで流用
# ファクトリ名とクラスが異なる場合には、以下のような記述もできる。(クラス名とファクトリ名が同じなら省略可能)
# factory :admin_user, class: User
  factory :user do
    name { 'テストユーザー' }
    email { 'test@exampole.com' }
    password { 'password' }
  end
end
