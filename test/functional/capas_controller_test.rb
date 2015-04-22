require 'test_helper'

class CapasControllerTest < ActionController::TestCase
  setup do
    @capa = capas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:capas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create capa" do
    assert_difference('Capa.count') do
      post :create, capa: { capa_number: @capa.capa_number, cause: @capa.cause, date: @capa.date, date_assigned: @capa.date_assigned, date_closed: @capa.date_closed, date_resolved: @capa.date_resolved, department: @capa.department, description: @capa.description, engineer: @capa.engineer, engr_comments: @capa.engr_comments, follow_up_actions: @capa.follow_up_actions, item_number: @capa.item_number, name: @capa.name, ncr: @capa.ncr, pump_model: @capa.pump_model, quality_comments: @capa.quality_comments, root: @capa.root, solution: @capa.solution, status: @capa.status, suggested: @capa.suggested }
    end

    assert_redirected_to capa_path(assigns(:capa))
  end

  test "should show capa" do
    get :show, id: @capa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @capa
    assert_response :success
  end

  test "should update capa" do
    put :update, id: @capa, capa: { capa_number: @capa.capa_number, cause: @capa.cause, date: @capa.date, date_assigned: @capa.date_assigned, date_closed: @capa.date_closed, date_resolved: @capa.date_resolved, department: @capa.department, description: @capa.description, engineer: @capa.engineer, engr_comments: @capa.engr_comments, follow_up_actions: @capa.follow_up_actions, item_number: @capa.item_number, name: @capa.name, ncr: @capa.ncr, pump_model: @capa.pump_model, quality_comments: @capa.quality_comments, root: @capa.root, solution: @capa.solution, status: @capa.status, suggested: @capa.suggested }
    assert_redirected_to capa_path(assigns(:capa))
  end

  test "should destroy capa" do
    assert_difference('Capa.count', -1) do
      delete :destroy, id: @capa
    end

    assert_redirected_to capas_path
  end
end
