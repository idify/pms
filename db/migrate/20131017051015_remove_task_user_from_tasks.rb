class RemoveTaskUserFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :task_user
  end

  def down
    add_column :tasks, :task_user, :string
  end
end
