require 'test_helper'

class Backoffice::CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get backoffice_category_index_url
    assert_response :success
  end

end
