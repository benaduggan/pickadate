require 'test_helper'

class DormsControllerTest < ActionController::TestCase
  setup do
    @dorm = dorms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dorms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dorm" do
    assert_difference('Dorm.count') do
      post :create, dorm: { name: @dorm.name }
    end

    assert_redirected_to dorm_path(assigns(:dorm))
  end

  test "should show dorm" do
    get :show, id: @dorm
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dorm
    assert_response :success
  end

  test "should update dorm" do
    patch :update, id: @dorm, dorm: { name: @dorm.name }
    assert_redirected_to dorm_path(assigns(:dorm))
  end

  test "should destroy dorm" do
    assert_difference('Dorm.count', -1) do
      delete :destroy, id: @dorm
    end

    assert_redirected_to dorms_path
  end
end
