class AddEstStartDateEstEndDateActStartDateActEndDateToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :est_start_date, :datetime
    add_column :tasks, :est_end_date, :datetime
    add_column :tasks, :act_start_date, :datetime
    add_column :tasks, :act_end_date, :datetime
  end
end
