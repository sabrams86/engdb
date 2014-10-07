require 'test_helper'

class RequestFilesControllerTest < ActionController::TestCase
  setup do
    @request_file = request_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:request_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create request_file" do
    assert_difference('RequestFile.count') do
      post :create, request_file: { file: @request_file.file, request_id: @request_file.request_id }
    end

    assert_redirected_to request_file_path(assigns(:request_file))
  end

  test "should show request_file" do
    get :show, id: @request_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @request_file
    assert_response :success
  end

  test "should update request_file" do
    put :update, id: @request_file, request_file: { file: @request_file.file, request_id: @request_file.request_id }
    assert_redirected_to request_file_path(assigns(:request_file))
  end

  test "should destroy request_file" do
    assert_difference('RequestFile.count', -1) do
      delete :destroy, id: @request_file
    end

    assert_redirected_to request_files_path
  end
end
