class Task < ActiveRecord::Base
  #attr_accessible :est_end_date, :project_id, :est_start_date, :act_start_date,:act_end_date,:user,:task_description
  #attr_accessible :task,:user_id,:project_module_id,:status
  validates :est_start_date, :est_end_date, :task, :presence => true
  validates :task, uniqueness: true
  validate  :date_validation
  belongs_to :project_module
  belongs_to :user
 
  def date_validation
    if (self.est_start_date.present? && self.est_end_date.present?) && (self.est_start_date > self.est_end_date)
	  	errors[:date] << "Est. Start date must be less than Est. end date"
	  end
  end


end
