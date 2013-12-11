class ProjectsController < ApplicationController
 #load_and_authorize_resource 
 before_action :check_project_alloted, :only=>[:create, :update]
 before_action do
  @users = User.select("id, email").where(isManager: true)
 end
  def new
 	  @project  = Project.new
  end

 def create
  @project  = Project.new(project_params)
    if @project.save
	    redirect_to projects_path, :notice => "Successfully submit Project details"
    else
      render :new
    end
	end

  def index
  	@projects = Project.all
  end

  def show
  	@project  = Project.find(params[:id])
  end

  def update
  	@project = Project.find(params[:id])
    	if  @project.update_attributes(project_params)
      	redirect_to projects_path, :notice => "Updated Successfully"
       else
      	 render :edit , :notice => "sorry..something is wrong"
      end
  end

  def destroy
  	project = Project.find(params[:id])  
    project.destroy
    redirect_to projects_path
  end

  def edit
  	@project = Project.find(params[:id])
  end

  private
  	def project_params
     	params.require(:project).permit(:description,:project_name,:est_start_date,:est_end_date,:act_start_date,:act_end_date,
			:additional_details, :user_id, :manager)
    end
    
    def check_project_alloted
      user_project = Project.where(user_id: params[:project][:user_id]).first
  	  if user_project.present?
    	  project = Project.where("date(est_start_date) >=? and date(est_end_date) <=? and user_id=?", params[:project][:est_start_date].to_date,       user_project.est_end_date.to_date, params[:project][:user_id])
    	  redirect_to projects_path , notice: "Project Rejected: can't assign new project on same alotted dates" if project.present?
      end
    end
end 
