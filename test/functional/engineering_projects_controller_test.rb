require 'test_helper'

class EngineeringProjectsControllerTest < ActionController::TestCase
  setup do
    @engineering_project = engineering_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engineering_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engineering_project" do
    assert_difference('EngineeringProject.count') do
      post :create, engineering_project: @engineering_project.attributes
    end

    assert_redirected_to engineering_project_path(assigns(:engineering_project))
  end

  test "should show engineering_project" do
    get :show, id: @engineering_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @engineering_project
    assert_response :success
  end

  test "should update engineering_project" do
    put :update, id: @engineering_project, engineering_project: @engineering_project.attributes
    assert_redirected_to engineering_project_path(assigns(:engineering_project))
  end

  test "should destroy engineering_project" do
    assert_difference('EngineeringProject.count', -1) do
      delete :destroy, id: @engineering_project
    end

    assert_redirected_to engineering_projects_path
  end
end
