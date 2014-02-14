require 'test_helper'

class TreqsControllerTest < ActionController::TestCase
  setup do
    @treq = treqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treq" do
    assert_difference('Treq.count') do
      post :create, treq: @treq.attributes
    end

    assert_redirected_to treq_path(assigns(:treq))
  end

  test "should show treq" do
    get :show, id: @treq
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @treq
    assert_response :success
  end

  test "should update treq" do
    put :update, id: @treq, treq: @treq.attributes
    assert_redirected_to treq_path(assigns(:treq))
  end

  test "should destroy treq" do
    assert_difference('Treq.count', -1) do
      delete :destroy, id: @treq
    end

    assert_redirected_to treqs_path
  end
end
