class User < ApplicationRecord
  # パスワードをハッシュ化
  has_secure_password

  # 名前とメールアドレス必須。メールアドレスは一意とする。
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # タスクテーブルと関連付け　（User　1対多　Task）
  has_many :tasks

end
