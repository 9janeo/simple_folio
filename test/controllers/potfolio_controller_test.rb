require 'test_helper'

class PotfolioControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get potfolio_index_url
    assert_response :success
  end

  test "should get show" do
    get potfolio_show_url
    assert_response :success
  end

end
