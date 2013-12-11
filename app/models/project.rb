class Project < ActiveRecord::Base
     #attr_accessible  :description,:project_name,  :Est_start_date,:Est_end_date,:Act_start_date,:Act_end_date,:Additional_details,:user_id,:manager
   validates  :est_start_date,:est_end_date,:project_name, :presence => true
   belongs_to :user
   has_many :project_users, :dependent => :destroy
   has_many :project_repositories
   has_many :project_modules, :dependent => :destroy
   has_many :login_details, :dependent => :destroy
   validate :date_validation

  def date_validation
	  if  (self.est_start_date.present? && self.est_end_date.present?) && (self.est_start_date > self.est_end_date)
		  errors[:date] << "Start date must be less than end date"
	  end
  end


end
