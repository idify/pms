class AddProjectIdToProjectModules < ActiveRecord::Migration
  def change
    add_column :project_modules, :project_id, :integer
  end
end
