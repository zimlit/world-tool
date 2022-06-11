class GalaxiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @galaxies = Galaxy.all
  end

  def show
    @galaxy = Galaxy.find(params[:id])
  end

  def new
    @galaxy = Galaxy.new
    @project_id = params[:project_id]
  end

  def create
    project = Project.find(galaxy_params[:project_id])
    if current_user.id != project.user_id
      flash[:alert] = "cant create a galaxy in someone elses project"
      redirect_to galaxies_path
    end
    galaxy = project.galaxies.create(galaxy_params) 
  end

  def update
    @galaxy = Galaxy.find(params[:id])
    project = Project.find(galaxy_params[:project_id])
    if current_user.id != project.user_id
      flash[:alert] = "cant edit someone elses galaxy"
    end
    @galaxy.update(galaxy_params)
    redirect_to galaxy_path(@galaxy)
  end

  def edit
    @galaxy = Galaxy.find(params[:id])
    @project_id = params[:project_id]
  end

  private

  def galaxy_params
    params.require(:galaxy).permit(:name, :description, :project_id)
  end
end
