class CreateProjectModules < ActiveRecord::Migration
  def change
    create_table :project_modules do |t|
      t.string :project_module_name
      t.string :project_module_description
      t.date :est_start_date
      t.date :est_end_date
      t.date :act_start_date
      t.date :act_end_date

      t.timestamps
    end
  end
end
