class AddTaskAndUserToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :task, :string
    add_column :tasks, :user, :string
  end
end
