class ProjectRepositoriesController < ApplicationController
  before_filter :check_manager
	def new
  	@project = Project.find(params[:project_id])
  	@project_repository = @project.project_repositories.new
  end

  def create
  	@project = Project.find(params[:project_id])
  	@project_repository  = @project.project_repositories.new(project_repository_params)
		if @project_repository.save
 			redirect_to project_project_repositories_path(@project), :notice => "Successfully submit project repository details"
		else
 			render :new 
    end
  end

  def index
  	@project = Project.find(params[:project_id])
   	@project_repositories = @project.project_repositories
  end

  def show
  	@project = Project.find(params[:project_id])
  	@project_repository  =  @project.project_repositories.find(params[:id])
 	end
 	
 	def edit
    @project = Project.find(params[:project_id])
    @project_repository  =  @project.project_repositories.find(params[:id])
  end
 
  def update
    @project = Project.find(params[:project_id])
    @project_repository = @project.project_repositories.find(params[:id])
    if @project_repository.update_attributes(project_repository_params)
     redirect_to project_project_repositories_path(@project), :notice => "Updated Successfully"
    else
      render :edit , :notice => "sorry..something is wrong"
    end
  end

  def destroy
  	@project = Project.find(params[:project_id])
  	project_repository = @project.project_repositories.find(params[:id])  
  	project_repository.destroy
		redirect_to project_project_repositories_path(@project), :notice => "Successfully deleted"
 	end

 	
  def download_doc
    @project = Project.find(params[:project_id])
    @project_repository = @project.project_repositories.find(params[:id])
    send_file @project_repository.document.path, :filename => "project_doc_#{@project_repository.id}",  :disposition => 'attachment', :type => 'application/all', x_sendfile: true 
    return
    
  end

   private
    def check_manager
		 @project = Project.find(params[:project_id]) 
		 redirect_to projects_path  if @project.user != current_user && !current_user.isAdmin
		end
  	def project_repository_params
	  	params.require(:project_repository).permit(:project_id, :title, :document, :document_url)
    end
end
