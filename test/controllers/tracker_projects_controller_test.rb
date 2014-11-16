require 'test_helper'

class TrackerProjectsControllerTest < ActionController::TestCase
  setup do
    @tracker_project = tracker_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tracker_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tracker_project" do
    assert_difference('TrackerProject.count') do
      post :create, tracker_project: { description: @tracker_project.description, name: @tracker_project.name }
    end

    assert_redirected_to tracker_project_path(assigns(:tracker_project))
  end

  test "should show tracker_project" do
    get :show, id: @tracker_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tracker_project
    assert_response :success
  end

  test "should update tracker_project" do
    patch :update, id: @tracker_project, tracker_project: { description: @tracker_project.description, name: @tracker_project.name }
    assert_redirected_to tracker_project_path(assigns(:tracker_project))
  end

  test "should destroy tracker_project" do
    assert_difference('TrackerProject.count', -1) do
      delete :destroy, id: @tracker_project
    end

    assert_redirected_to tracker_projects_path
  end
end
