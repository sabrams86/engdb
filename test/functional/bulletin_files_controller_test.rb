require 'test_helper'

class BulletinFilesControllerTest < ActionController::TestCase
  setup do
    @bulletin_file = bulletin_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bulletin_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bulletin_file" do
    assert_difference('BulletinFile.count') do
      post :create, bulletin_file: { bulletin_id: @bulletin_file.bulletin_id, file: @bulletin_file.file }
    end

    assert_redirected_to bulletin_file_path(assigns(:bulletin_file))
  end

  test "should show bulletin_file" do
    get :show, id: @bulletin_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bulletin_file
    assert_response :success
  end

  test "should update bulletin_file" do
    put :update, id: @bulletin_file, bulletin_file: { bulletin_id: @bulletin_file.bulletin_id, file: @bulletin_file.file }
    assert_redirected_to bulletin_file_path(assigns(:bulletin_file))
  end

  test "should destroy bulletin_file" do
    assert_difference('BulletinFile.count', -1) do
      delete :destroy, id: @bulletin_file
    end

    assert_redirected_to bulletin_files_path
  end
end
