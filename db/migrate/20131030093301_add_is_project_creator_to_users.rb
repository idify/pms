class AddIsProjectCreatorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :isProject_creator, :boolean,:default => false
  end
end
