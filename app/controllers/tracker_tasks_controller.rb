class TrackerTasksController < ApplicationController
  before_action :set_tracker_task, only: [:show, :edit, :update, :destroy, :act]
  before_action :check_adminity, only: [:new, :edit, :update, :destroy, :create, :delete]


  def act
    if params[:execute]
      TrackerTask.find(@tracker_task.id).fire_state_event(params[:execute]);

    else
  
    end
    @z = params
    params.inspect
  #  redirect_to tracker_task_path(@tracker_task.id)
    redirect_to tracker_tasks_path()
  end
  # GET /tracker_tasks
  # GET /tracker_tasks.json
  def index


    
    
    @states = ['initialized', 'accepted', 'verified', 'in_process', 'in_test', 'executed']
    @acts   = ['accept', 'verify', 'start_process', 'finish_process', 'test_passed', 'none']
    if params[:tag]
    @tracker_tasks = TrackerTask.tagged_with(params[:tag]).all  
    else 
    @tracker_tasks = TrackerTask.all
    end
  end

  # GET /tracker_tasks/1
  # GET /tracker_tasks/1.json
  def show
  end

  # GET /tracker_tasks/new
  def new
    @tracker_task = TrackerTask.new
    @tracker_task.initiator_id = current_user.id
  end

  # GET /tracker_tasks/1/edit
  def edit
  end

  # POST /tracker_tasks
  # POST /tracker_tasks.json
  def create
    @tracker_task = TrackerTask.new(tracker_task_params)

    respond_to do |format|
      if @tracker_task.save
        format.html { redirect_to @tracker_task, notice: 'Tracker task was successfully created.' }
        format.json { render :show, status: :created, location: @tracker_task }
      else
        format.html { render :new }
        format.json { render json: @tracker_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracker_tasks/1
  # PATCH/PUT /tracker_tasks/1.json
  def update
    respond_to do |format|
      if @tracker_task.update(tracker_task_params)
        format.html { redirect_to @tracker_task, notice: 'Tracker task was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracker_task }
      else
        format.html { render :edit }
        format.json { render json: @tracker_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracker_tasks/1
  # DELETE /tracker_tasks/1.json
  def destroy
    @tracker_task.destroy
    respond_to do |format|
      format.html { redirect_to tracker_tasks_url, notice: 'Tracker task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracker_task
      @tracker_task = TrackerTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracker_task_params
      params.require(:tracker_task).permit(:cost,
       :title, :description, :initiator_id, 
       :user_id, :tracker_project_id, :tag_list)
    end
end
