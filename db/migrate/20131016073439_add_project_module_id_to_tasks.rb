class AddProjectModuleIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :project_module_id, :integer
  end
end
