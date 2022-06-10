class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    project = current_user.projects.create(project_params)

    redirect_to projects_path
  end
    

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if current_user.id != @project.user_id
      flash[:alert] = "cant edit somone elses project"
      redirect_to projects_path and return 
    end
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    if current_user.id != @project.user_id
      flash[:alert] = "cant remove somone elses project"
      redirect_to projects_path and return 
    end
    @project.destroy

    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit( :name, :description)
  end
end
