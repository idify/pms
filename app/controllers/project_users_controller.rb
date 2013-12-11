class ProjectUsersController < ApplicationController
  load_and_authorize_resource
  before_action :check_manager
  before_action do
    @users = User.select("id, email").where(isManager: false)
  end

  def new
    @project = Project.find(params[:project_id])
    @project_user = @project.project_users.new
    @users = User.select("id, email").where(isManager: false)
  end

  def create
    @project = Project.find(params[:project_id])
    @project_user = @project.project_users.create(project_user_params)
  	if @project_user.save
      #UserMailer.task_confirmation(@project_user).deliver
    	redirect_to project_project_users_path(@project), :notice => "Successfully submitted  project user details"
    else
     		render :new 
  	end
  end

  def index
    @project = Project.find(params[:project_id])
    @project_users = @project.project_users
  end

  def show
    @project = Project.find(params[:project_id])
    @project_user =  @project.project_users.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @project_user = @project.project_users.find(params[:id])
		if @project_user.update_attributes(project_user_params)
    	redirect_to project_project_users_path(@project), :notice => "Updated Successfully"
		else
      render :edit , :notice => "sorry..something is wrong"
		end
  end

  def destroy
    @project = Project.find(params[:project_id])
    project_user = @project.project_users.find(params[:id])  
    project_user.destroy
    redirect_to project_project_users_path(@project), :notice => "Successfully deleted"
  end

  def edit
    @project = Project.find(params[:project_id])
    @project_user  = @project.project_users.find(params[:id])
    @users = User.select("id, email").where(isManager: false)
  end

private
	def check_manager
	 @project = Project.find(params[:project_id]) 
	 redirect_to projects_path  if @project.user != current_user && !current_user.isAdmin
	end

	def project_user_params
  	params.require(:project_user).permit(:project_id, :user_id, :start_date, :end_date)
  end
end
