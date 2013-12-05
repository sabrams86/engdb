require 'test_helper'

class EngineeringProceduresControllerTest < ActionController::TestCase
  setup do
    @engineering_procedure = engineering_procedures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:engineering_procedures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create engineering_procedure" do
    assert_difference('EngineeringProcedure.count') do
      post :create, engineering_procedure: @engineering_procedure.attributes
    end

    assert_redirected_to engineering_procedure_path(assigns(:engineering_procedure))
  end

  test "should show engineering_procedure" do
    get :show, id: @engineering_procedure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @engineering_procedure
    assert_response :success
  end

  test "should update engineering_procedure" do
    put :update, id: @engineering_procedure, engineering_procedure: @engineering_procedure.attributes
    assert_redirected_to engineering_procedure_path(assigns(:engineering_procedure))
  end

  test "should destroy engineering_procedure" do
    assert_difference('EngineeringProcedure.count', -1) do
      delete :destroy, id: @engineering_procedure
    end

    assert_redirected_to engineering_procedures_path
  end
end
