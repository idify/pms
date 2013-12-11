class RemoveStartDateAndEndDateFromTasks < ActiveRecord::Migration
  def up
    remove_column :tasks, :start_date
    remove_column :tasks, :end_date
  end

  def down
    add_column :tasks, :end_date, :date
    add_column :tasks, :start_date, :date
  end
end
