require 'test_helper'

class TrackerTasksControllerTest < ActionController::TestCase
  setup do
    @tracker_task = tracker_tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tracker_tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tracker_task" do
    assert_difference('TrackerTask.count') do
      post :create, tracker_task: { cost: @tracker_task.cost, description: @tracker_task.description, initiator_id: @tracker_task.initiator_id, title: @tracker_task.title, user_id: @tracker_task.user_id }
    end

    assert_redirected_to tracker_task_path(assigns(:tracker_task))
  end

  test "should show tracker_task" do
    get :show, id: @tracker_task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tracker_task
    assert_response :success
  end

  test "should update tracker_task" do
    patch :update, id: @tracker_task, tracker_task: { cost: @tracker_task.cost, description: @tracker_task.description, initiator_id: @tracker_task.initiator_id, title: @tracker_task.title, user_id: @tracker_task.user_id }
    assert_redirected_to tracker_task_path(assigns(:tracker_task))
  end

  test "should destroy tracker_task" do
    assert_difference('TrackerTask.count', -1) do
      delete :destroy, id: @tracker_task
    end

    assert_redirected_to tracker_tasks_path
  end
end
