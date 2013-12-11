class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Setup accessible (or protected) attributes for your model
   #attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :isAdmin
   #attr_accessible :name, :sap_id, :isManager
 has_many :projects
 has_many:project_users
 has_many :tasks
 has_many :permissions, :through => :permission_users
 

  def isProject_creator?
   self.isProject_creator
  end

end
