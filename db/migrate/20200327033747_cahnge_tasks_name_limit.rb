class CahngeTasksNameLimit < ActiveRecord::Migration[5.2]
  # Taskテーブルの名前を30文字に制限。バージョンを戻す際は制限をなくす。
  def up
    change_column :tasks, :name, :string, limit: 30
  end
  def down
    change_column :tasks, :name, :string
  end

end
