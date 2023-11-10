require "test_helper"

class PiscinesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get piscines_show_url
    assert_response :success
  end

  test "should get index" do
    get piscines_index_url
    assert_response :success
  end

  test "should get create" do
    get piscines_create_url
    assert_response :success
  end

  test "should get new" do
    get piscines_new_url
    assert_response :success
  end
end
