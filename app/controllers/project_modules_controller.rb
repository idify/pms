class ProjectModulesController < ApplicationController
	before_action :check_manager
  before_action :check_project_date, only: [:create, :update]
  
  def new
    @project = Project.find(params[:project_id])
    if !@project.act_end_date.present?
      @project_module  = @project.project_modules.new
    else
      redirect_to project_project_modules_path(@project), notice: "Sorry!! Project has been completed."
    end
  end

  def create
   @project = Project.find(params[:project_id])
   @project_module  =@project.project_modules.new(project__module_params)
   if @project_module.save
    redirect_to project_project_modules_path(@project), :notice => "Successfully submit Project Module's details"
   else
    render :new 
   end
  end

  def index
    @project = Project.find(params[:project_id])
    @project_modules = @project.project_modules
  end

  def show
    @project = Project.find(params[:project_id])
    @project_module =  @project.project_modules.find(params[:id])
	end

  def update
    @project = Project.find(params[:project_id])
    @project_module = @project.project_modules.find(params[:id])
    if @project_module.update_attributes(project__module_params)
      redirect_to project_project_modules_path(@project), :notice => "Updated Successfully"
    else
      render :edit
    end
  end

  def destroy
   @project = Project.find(params[:project_id])
   project_module = @project.project_modules.find(params[:id])  
   project_module.destroy
   redirect_to project_project_modules_path(@project), :notice => "Successfully deleted"
  end

  def edit
   @project = Project.find(params[:project_id])
   @project_module  = @project.project_modules.find(params[:id])
  end
   
  private
		def check_manager
		 @project = Project.find(params[:project_id])  
		 redirect_to projects_path  if @project.user != current_user && !current_user.isAdmin
		end
  	def project__module_params
	  	params.require(:project_module).permit(:act_end_date, :act_start_date, :est_end_date, :est_start_date, :project_module_description, :project_module_name,:project_id)
    end
    def check_project_date
      @project = Project.find(params[:project_id])
      if @project.present?
        if (params[:project_module][:est_start_date].present? && (params[:project_module][:est_start_date]).to_date < (@project.est_start_date)) 
          flash[:notice] = "Project  Module Rejected as Module's Estimated Start date is less than Project's Estimated Start date"
          redirect_to new_project_project_module_path(@project)
        elsif (params[:project_module][:est_end_date].present? && (params[:project_module][:est_end_date]).to_date  > (@project.est_end_date))
           flash[:notice] = "Project  Module Rejected as Module's Estimated End date is greater than Project's Estimated End date"
           redirect_to new_project_project_module_path(@project)
        end
      end
    end
end
