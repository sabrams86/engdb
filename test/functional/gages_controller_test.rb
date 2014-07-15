require 'test_helper'

class GagesControllerTest < ActionController::TestCase
  setup do
    @gage = gages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gage" do
    assert_difference('Gage.count') do
      post :create, gage: { calibration_date: @gage.calibration_date, calibration_period: @gage.calibration_period, description: @gage.description, gage_number: @gage.gage_number, gage_type: @gage.gage_type, location: @gage.location, rating: @gage.rating, servicing_company: @gage.servicing_company, servicing_phone: @gage.servicing_phone }
    end

    assert_redirected_to gage_path(assigns(:gage))
  end

  test "should show gage" do
    get :show, id: @gage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gage
    assert_response :success
  end

  test "should update gage" do
    put :update, id: @gage, gage: { calibration_date: @gage.calibration_date, calibration_period: @gage.calibration_period, description: @gage.description, gage_number: @gage.gage_number, gage_type: @gage.gage_type, location: @gage.location, rating: @gage.rating, servicing_company: @gage.servicing_company, servicing_phone: @gage.servicing_phone }
    assert_redirected_to gage_path(assigns(:gage))
  end

  test "should destroy gage" do
    assert_difference('Gage.count', -1) do
      delete :destroy, id: @gage
    end

    assert_redirected_to gages_path
  end
end
