require 'test_helper'

class TrackerUsersControllerTest < ActionController::TestCase
  setup do
    @tracker_user = tracker_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tracker_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tracker_user" do
    assert_difference('TrackerUser.count') do
      post :create, tracker_user: { email: @tracker_user.email, is_admin: @tracker_user.is_admin }
    end

    assert_redirected_to tracker_user_path(assigns(:tracker_user))
  end

  test "should show tracker_user" do
    get :show, id: @tracker_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tracker_user
    assert_response :success
  end

  test "should update tracker_user" do
    patch :update, id: @tracker_user, tracker_user: { email: @tracker_user.email, is_admin: @tracker_user.is_admin }
    assert_redirected_to tracker_user_path(assigns(:tracker_user))
  end

  test "should destroy tracker_user" do
    assert_difference('TrackerUser.count', -1) do
      delete :destroy, id: @tracker_user
    end

    assert_redirected_to tracker_users_path
  end
end
