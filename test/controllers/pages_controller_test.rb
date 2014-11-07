require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get trang_chu" do
    get :trang_chu
    assert_response :success
  end

end
