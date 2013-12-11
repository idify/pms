class UserMailer < ActionMailer::Base
default :from => "vinaycs01@gmail.com"
  
  def task_confirmation(user)
		 @project_user = user
      mail(:to => "#{@project_user.user.email}", :subject => "Project assigned")
  end
end
