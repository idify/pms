class UsersController < ApplicationController
	
	

	def index
  	if current_user.isAdmin
    	@users = User.all
      @projects = Project.all
    else
     flash[:notice] = "You are not authorized to access this page."
    	redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
 	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
    	redirect_to users_path, :notice => "Updated Successfully"
    else
    	render "edit"
    end
  end    

  def show
 	  @user = User.find(params[:id])
  end

	def user_task
		@user = User.find(params[:id])
		@tasks = @user.tasks
	end

  def all_tasks
    @user = User.find(params[:id])
    @all_projects = @user.project_users
    @tasks = @user.tasks
  end

   def status_update
		@user = User.find(params[:user_id])
    @task = Task.find(params[:task_id])
		if @task.update_attributes(:status => params[:status])
			flash[:notice] = "task updated"
			redirect_to all_tasks_user_path(@user.id)
		else
			flash[:notice] = "Opps error occured"
     redirect_to all_tasks_user_path(@user.id)
		end
   end
  
  def destroy
 	session[:user_id] = nil
  	redirect_to user_path(@user), :notice => "Signed out!"
  end
 
  private
 	 def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :remember_me, :username, :isAdmin,
    :name, :sap_id, :isManager,:isProject_creator)
   end
end

