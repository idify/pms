class LoginDetailsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @login_details = @project.login_details
  end
  
  def new
    @project = Project.find(params[:project_id])
    @login_detail = @project.login_details.new
  end
  
  def create
    @project = Project.find(params[:project_id])
    @login_detail = @project.login_details.new(login_params)
    if @login_detail.save
      redirect_to project_login_details_path(@project)
    else
      render :new
    end
  end
  
  def edit
    @project = Project.find(params[:project_id])
    @login_detail = @project.login_details.find(params[:id])
  end
  
  def show
  end
  
  def update
    @project = Project.find(params[:project_id])
    @login_detail = @project.login_details.new(login_params)
    if @login_detail.update_attributes(login_params)
      redirect_to project_login_details_path(@project)
    else
      render :new
    end
  end
  
  def destroy
  end
  
  
  private
  
  def login_params
    params.require(:login_detail).permit(:user_name, :password, :git_url, :description) 
  end
end
