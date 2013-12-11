class ProjectUser < ActiveRecord::Base
  #attr_accessible :project_id, :user_id, :start_date, :end_date
  #validates :start_date, :end_date, :presence => true
  validates :user_id, :uniqueness => {:scope => :project_id}
  validate :date_validation

  belongs_to :user
  belongs_to :project

  def date_validation
    if  (self.start_date.present? && self.end_date.present?) && (self.start_date > self.end_date)
		  errors[:date] << "Start date must be less than end date"
	  end
  end

end

