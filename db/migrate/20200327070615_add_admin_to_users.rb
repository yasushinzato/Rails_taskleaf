class AddAdminToUsers < ActiveRecord::Migration[5.2]
  # 管理者フラグを追加
  def change
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
