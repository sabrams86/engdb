require 'test_helper'

class ProductBulletinsControllerTest < ActionController::TestCase
  setup do
    @product_bulletin = product_bulletins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_bulletins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_bulletin" do
    assert_difference('ProductBulletin.count') do
      post :create, product_bulletin: @product_bulletin.attributes
    end

    assert_redirected_to product_bulletin_path(assigns(:product_bulletin))
  end

  test "should show product_bulletin" do
    get :show, id: @product_bulletin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_bulletin
    assert_response :success
  end

  test "should update product_bulletin" do
    put :update, id: @product_bulletin, product_bulletin: @product_bulletin.attributes
    assert_redirected_to product_bulletin_path(assigns(:product_bulletin))
  end

  test "should destroy product_bulletin" do
    assert_difference('ProductBulletin.count', -1) do
      delete :destroy, id: @product_bulletin
    end

    assert_redirected_to product_bulletins_path
  end
end
