class CreateProjectRepositories < ActiveRecord::Migration
  def change
    create_table :project_repositories do |t|
      t.integer :project_id
      t.string :title
      t.string :document
      t.string :document_url
      t.timestamps
    end
  end
end
