require 'test_helper'

class TreqFilesControllerTest < ActionController::TestCase
  setup do
    @treq_file = treq_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treq_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treq_file" do
    assert_difference('TreqFile.count') do
      post :create, treq_file: { file: @treq_file.file, treq_id: @treq_file.treq_id }
    end

    assert_redirected_to treq_file_path(assigns(:treq_file))
  end

  test "should show treq_file" do
    get :show, id: @treq_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @treq_file
    assert_response :success
  end

  test "should update treq_file" do
    put :update, id: @treq_file, treq_file: { file: @treq_file.file, treq_id: @treq_file.treq_id }
    assert_redirected_to treq_file_path(assigns(:treq_file))
  end

  test "should destroy treq_file" do
    assert_difference('TreqFile.count', -1) do
      delete :destroy, id: @treq_file
    end

    assert_redirected_to treq_files_path
  end
end
