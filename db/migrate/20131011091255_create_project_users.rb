class CreateProjectUsers < ActiveRecord::Migration
  def change
    create_table :project_users do |t|
      t.references :project
      t.references :user 
      t.date :start_date
      t.date :end_date
      t.integer :permission
      t.timestamps
    end
  end
end
