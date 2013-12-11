class TasksController < ApplicationController
 load_and_authorize_resource :except=>[:task_update,:task_under,:task_deploy]
 before_action :check_manager
 before_action do
    Time.zone =  "Asia/Kolkata"
    @project = Project.find(params[:project_id])
    @users = @project.project_users
 end
 before_action :check_module_date, only: [:create, :update]

	def new
		@project = Project.find(params[:project_id])
		@project_module = ProjectModule.find(params[:project_module_id])
		@users = @project.project_users
		if !@project_module.act_end_date.present?
		  @task = @project_module.tasks.new
		else
		  redirect_to project_project_module_tasks_path(@project,@project_module), notice: "Sorry!! Module is already completed."
		end
	end

	def index
		@project = Project.find(params[:project_id])
		@project_module = ProjectModule.find(params[:project_module_id])
		@tasks = @project_module.tasks
	end
	
	def create	
	  @project = Project.find(params[:project_id])
		@project_module = ProjectModule.find(params[:project_module_id])
		@task  =@project_module.tasks.new(task_params)
		if @task.save
			redirect_to project_project_module_tasks_path(@project,@project_module), :notice => "Successfully submit Task's details"
		else
			render :new 
		end		
  end

  def edit
   @project = Project.find(params[:project_id])
   @project_module = ProjectModule.find(params[:project_module_id])
   @task  = Task.find(params[:id])
  end

  def show
   @project = Project.find(params[:project_id])
   @project_module = ProjectModule.find(params[:project_module_id])
   @task  =  @project_module.tasks.find(params[:id])
  end

  def update
   @project = Project.find(params[:project_id])
   @project_module = ProjectModule.find(params[:project_module_id])
   @task= @project_module.tasks.find(params[:id])
    if @task.update_attributes(task_params)
     redirect_to project_project_module_tasks_path(@project, @project_module), :notice => "Updated Successfully"
     else
      render :edit , :notice => "sorry..something is wrong"
    end
  end

  def destroy
   @project = Project.find(params[:project_id])
   @project_module = ProjectModule.find(params[:project_module_id])
   task = Task.find(params[:id])  
   task.destroy
    redirect_to project_project_module_tasks_path(@project,@project_module), :notice => "Successfully deleted"
  end
	
	def task_update
    #ProjectUser.update_all({start_date: Time.now.in_time_zone("Asia/Kolkata")},["project_id = ?", @project.id.to_s])
    task = Task.find(params[:id])
    task.act_start_date = Time.now.in_time_zone("Asia/Kolkata")
    task.status = params[:status]	
    if task.save
      @project_module = ProjectModule.find(params[:project_module_id])
      if !@project_module.act_start_date.present?
        @project_module.act_start_date = Time.now.in_time_zone("Asia/Kolkata")
        if @project_module.save
          @project = Project.find(params[:project_id])
          if !@project.act_start_date.present?
            @project.act_start_date = Time.now.in_time_zone("Asia/Kolkata")
            @project.save
          end
        end
      end
      if task.status == 3
        s = @project_module.tasks.where.not("status = ?", 3)
        if s.size==0
         @project_module.act_end_date=	Time.now.in_time_zone("Asia/Kolkata")
         @project_module.project.act_end_date= Time.now.in_time_zone("Asia/Kolkata")
         @project_module.save
         @project_module.project.save
         redirect_to project_project_module_tasks_path(@project, @project_module), :notice => "Module completed"
         return
        end
      end
	    redirect_to project_project_module_tasks_path(@project, @project_module), notice: "Task Updated"
    else
	    redirect_to project_project_module_tasks_path(@project, @project_module), notice: "oops...task not updated"
    end 
	end
   
  

private
  def check_manager
	 @project = Project.find(params[:project_id]) 
	 redirect_to projects_path  if @project.user != current_user && !current_user.isAdmin
	end

  def task_params
   params.require(:task).permit(:est_end_date, :project_id, :est_start_date, :act_start_date,:act_end_date,:user,:task_description,
    :task,:user_id,:project_module_id,:status)
  end
  
  def check_module_date
    @project = Project.find(params[:project_id])
    if !@project.act_start_date.present?
      @project.act_start_date  = Time.now.in_time_zone("Asia/Kolkata")
    end
    @project_module = ProjectModule.find(params[:project_module_id])
 		if @project_module.present?
      if !@project_module.act_start_date.present?
        @project_module.act_start_date  = Time.now.in_time_zone("Asia/Kolkata")
      end
      if (params[:task][:est_start_date].present? && (params[:task][:est_start_date]).to_date < (@project_module.est_start_date))
  		  flash[:notice] = "Task Rejected as task's Estimated Start date is less than Module's Estimated Start date"
  			redirect_to new_project_project_module_task_path(@project, @project_module)
 			elsif (params[:task][:est_end_date].present? && (params[:task][:est_end_date]).to_date > (@project_module.est_end_date)) 
 				flash[:notice] = "Task Rejected as Task's Estimated End date is greater than Module's Estimated End date"
 				redirect_to new_project_project_module_task_path(@project, @project_module)
      end
    end
  end
end











