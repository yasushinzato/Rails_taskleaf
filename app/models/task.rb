class Task < ApplicationRecord
  # 必須データチェック、最大30文字、カンマは含まない
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  # ransack検索条件で他の項目検索が行えないようにしておく.オーバーライドして、名称と作成日時だけを許可。詳細は含めない
  # Strong Parametersではなく、params[:q]などに何が入ってもいいようにしておく。その制御が一般的。
  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end
  # 空の配列を返すようにオーバーライドして、検索条件に意図しない関連を含めないようにする。
  def self.ransackable_associations(auth_object = nil)
    []
  end

  # タスクをCSV出力(出力項目の定義) # config/apprication.rb　でCSVライブラリを追加
  def self.csv_attributes
    ["name", "description", "created_at", "updated_at"]
  end
  # タスクをCSV出力
  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{|attr| task.send(attr) }
      end
    end
  end

  # タスクをCSV入力
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      task = new
      task.attributes = row.to_hash.slice(*csv_attributes)
      task.save!
    end
  end

  # nilの場合は名前無しをセット
#  before_validation :set_nameless_name

  # 画像（ファイル）テーブルと関連付け (Storage  1対1  Task)
  has_one_attached :image
  # ユーザーテーブルと関連付け　（User　1対多　Task）
  belongs_to :user

  # scopeでソートを作成
  scope :recent, -> { order(created_at: :desc) }

  private
  
  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end

  # エラー確認のため、コメントアウト　before_validationもコメントアウト
  # def set_nameless_name
  #   self.name = '名前無し' if name.blank?
  # end

end
