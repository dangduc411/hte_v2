require 'test_helper'

class Admin::ProductsControllerTest < ActionController::TestCase
  setup do
    @admin_product = admin_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_product" do
    assert_difference('Admin::Product.count') do
      post :create, admin_product: { deposit_price: @admin_product.deposit_price, name: @admin_product.name, rental_price: @admin_product.rental_price, sales_price: @admin_product.sales_price, selling_price: @admin_product.selling_price, slug: @admin_product.slug }
    end

    assert_redirected_to admin_product_path(assigns(:admin_product))
  end

  test "should show admin_product" do
    get :show, id: @admin_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_product
    assert_response :success
  end

  test "should update admin_product" do
    patch :update, id: @admin_product, admin_product: { deposit_price: @admin_product.deposit_price, name: @admin_product.name, rental_price: @admin_product.rental_price, sales_price: @admin_product.sales_price, selling_price: @admin_product.selling_price, slug: @admin_product.slug }
    assert_redirected_to admin_product_path(assigns(:admin_product))
  end

  test "should destroy admin_product" do
    assert_difference('Admin::Product.count', -1) do
      delete :destroy, id: @admin_product
    end

    assert_redirected_to admin_products_path
  end
end
