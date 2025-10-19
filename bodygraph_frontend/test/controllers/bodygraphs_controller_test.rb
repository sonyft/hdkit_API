require "test_helper"

class BodygraphsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bodygraphs_index_url
    assert_response :success
  end

  test "should get show" do
    get bodygraphs_show_url
    assert_response :success
  end

  test "should get new" do
    get bodygraphs_new_url
    assert_response :success
  end

  test "should get create" do
    get bodygraphs_create_url
    assert_response :success
  end
end
