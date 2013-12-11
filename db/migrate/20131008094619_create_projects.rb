class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string   :project_name
      t.text   :description
      t.date     :est_start_date
      t.date     :est_end_date
      t.date     :act_start_date
      t.date     :act_end_date
      t.text   :additional_details
      t.integer  :user_id
      

      t.timestamps
    end
  end
end
