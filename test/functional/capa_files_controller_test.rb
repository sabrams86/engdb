require 'test_helper'

class CapaFilesControllerTest < ActionController::TestCase
  setup do
    @capa_file = capa_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:capa_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capa_file" do
    assert_difference('CapaFile.count') do
      post :create, capa_file: { capa_id: @capa_file.capa_id, file: @capa_file.file }
    end

    assert_redirected_to capa_file_path(assigns(:capa_file))
  end

  test "should show capa_file" do
    get :show, id: @capa_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @capa_file
    assert_response :success
  end

  test "should update capa_file" do
    put :update, id: @capa_file, capa_file: { capa_id: @capa_file.capa_id, file: @capa_file.file }
    assert_redirected_to capa_file_path(assigns(:capa_file))
  end

  test "should destroy capa_file" do
    assert_difference('CapaFile.count', -1) do
      delete :destroy, id: @capa_file
    end

    assert_redirected_to capa_files_path
  end
end
