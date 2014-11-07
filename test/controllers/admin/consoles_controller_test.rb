require 'test_helper'

class Admin::ConsolesControllerTest < ActionController::TestCase
  setup do
    @admin_console = admin_consoles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_consoles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_console" do
    assert_difference('Admin::Console.count') do
      post :create, admin_console: { available: @admin_console.available, name: @admin_console.name, product_id: @admin_console.product_id, slug: @admin_console.slug }
    end

    assert_redirected_to admin_console_path(assigns(:admin_console))
  end

  test "should show admin_console" do
    get :show, id: @admin_console
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_console
    assert_response :success
  end

  test "should update admin_console" do
    patch :update, id: @admin_console, admin_console: { available: @admin_console.available, name: @admin_console.name, product_id: @admin_console.product_id, slug: @admin_console.slug }
    assert_redirected_to admin_console_path(assigns(:admin_console))
  end

  test "should destroy admin_console" do
    assert_difference('Admin::Console.count', -1) do
      delete :destroy, id: @admin_console
    end

    assert_redirected_to admin_consoles_path
  end
end
