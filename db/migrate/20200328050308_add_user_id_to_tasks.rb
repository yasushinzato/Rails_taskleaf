class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  def up
    # タスクテーブルとユーザーIDを紐付け(Not Null制約)るため、既存のタスクは一旦削除しておく必要がある。
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null: false, idex: true
  end

  def down
    remove_reference :tasks, :user, index: true
  end

end
