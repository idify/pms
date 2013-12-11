class RemoveImageFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :image
  end

  def down
    add_column :projects, :image, :string
  end
end
