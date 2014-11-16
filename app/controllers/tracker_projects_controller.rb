class TrackerProjectsController < ApplicationController
  before_action :set_tracker_project, only: [:show, :edit, :update, :destroy]
  before_action :check_adminity, only: [:edit, :update, :destroy, :new, :delete, :create]

  # GET /tracker_projects
  # GET /tracker_projects.json
  def index
    @tracker_projects = TrackerProject.all
  end

  # GET /tracker_projects/1
  # GET /tracker_projects/1.json
  def show
  end

  # GET /tracker_projects/new
  def new
    @tracker_project = TrackerProject.new
  end

  # GET /tracker_projects/1/edit
  def edit
  end

  # POST /tracker_projects
  # POST /tracker_projects.json
  def create
    @tracker_project = TrackerProject.new(tracker_project_params)

    respond_to do |format|
      if @tracker_project.save
        format.html { redirect_to @tracker_project, notice: 'Tracker project was successfully created.' }
        format.json { render :show, status: :created, location: @tracker_project }
      else
        format.html { render :new }
        format.json { render json: @tracker_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracker_projects/1
  # PATCH/PUT /tracker_projects/1.json
  def update
    respond_to do |format|
      if @tracker_project.update(tracker_project_params)
        format.html { redirect_to @tracker_project, notice: 'Tracker project was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracker_project }
      else
        format.html { render :edit }
        format.json { render json: @tracker_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracker_projects/1
  # DELETE /tracker_projects/1.json
  def destroy
    @tracker_project.destroy
    respond_to do |format|
      format.html { redirect_to tracker_projects_url, notice: 'Tracker project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracker_project
      @tracker_project = TrackerProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracker_project_params
      params.require(:tracker_project).permit(:name, :description)
    end
end
