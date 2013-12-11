class ProjectModule < ActiveRecord::Base
  #attr_accessible :act_end_date, :act_start_date, :est_end_date, :est_start_date, :project_module_description, :project_module_name,:project_id

  validates        :est_end_date, :est_start_date,:project_module_name, :presence => true

  validate :date_validation

  belongs_to :project
  has_many  :tasks, :dependent => :destroy
   
  def date_validation
    if (self.est_start_date.present? && self.est_end_date.present?) && (self.est_start_date > self.est_end_date)
		  errors[:date] << "Est Start date must be less than Est end date"
	  end
  end
  
end
