class TrackerUsersController < ApplicationController
  before_action :set_tracker_user, only: [:show, :edit, :update, :destroy]
  before_action :check_adminity

  # GET /tracker_users
  # GET /tracker_users.json
  def index
    @tracker_users = TrackerUser.all
  end

  # GET /tracker_users/1
  # GET /tracker_users/1.json
  def show
  end

  # GET /tracker_users/new
  def new
    @tracker_user = TrackerUser.new
  end

  # GET /tracker_users/1/edit
  def edit
  end

  # POST /tracker_users
  # POST /tracker_users.json
  def create
    @tracker_user = TrackerUser.new(tracker_user_params)
    @tracker_user.password = @tracker_user.email

    respond_to do |format|
      if @tracker_user.save
        format.html { redirect_to @tracker_user, notice: 'Tracker user was successfully created.' }
        format.json { render :show, status: :created, location: @tracker_user }
      else
        format.html { render :new }
        format.json { render json: @tracker_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracker_users/1
  # PATCH/PUT /tracker_users/1.json
  def update
    respond_to do |format|
      if @tracker_user.update(tracker_user_params)
        format.html { redirect_to @tracker_user, notice: 'Tracker user was successfully updated.' }
        format.json { render :show, status: :ok, location: @tracker_user }
      else
        format.html { render :edit }
        format.json { render json: @tracker_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracker_users/1
  # DELETE /tracker_users/1.json
  def destroy
    @tracker_user.destroy
    respond_to do |format|
      format.html { redirect_to tracker_users_url, notice: 'Tracker user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tracker_user
      @tracker_user = TrackerUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tracker_user_params
      params.require(:tracker_user).permit(:email, :is_admin)
    end
end
