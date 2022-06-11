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
    project_id = galaxy_params[:project_id]
    galaxy = Project.find(project_id).galaxies.create(galaxy_params) 
  end

  def edit
  end

  private

  def galaxy_params
    params.require(:galaxy).permit(:name, :description, :project_id)
  end
end
