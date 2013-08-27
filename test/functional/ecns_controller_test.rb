require 'test_helper'

class EcnsControllerTest < ActionController::TestCase
  setup do
    @ecn = ecns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ecns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ecn" do
    assert_difference('Ecn.count') do
      post :create, ecn: @ecn.attributes
    end

    assert_redirected_to ecn_path(assigns(:ecn))
  end

  test "should show ecn" do
    get :show, id: @ecn
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ecn
    assert_response :success
  end

  test "should update ecn" do
    put :update, id: @ecn, ecn: @ecn.attributes
    assert_redirected_to ecn_path(assigns(:ecn))
  end

  test "should destroy ecn" do
    assert_difference('Ecn.count', -1) do
      delete :destroy, id: @ecn
    end

    assert_redirected_to ecns_path
  end
end
