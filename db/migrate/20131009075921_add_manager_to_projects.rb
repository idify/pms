class AddManagerToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :manager, :string
  end
end
