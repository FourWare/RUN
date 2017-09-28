require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end
  
  test "should get eventCreate" do
    get users_eventCreate_url
    assert_response :success
  end
  
  test "should get new contactanos" do
    get users_new_contactanos_url
    assert_response :success
  end
  
  test "should get create_contactanos" do
    get users_create_contactanos_url
    assert_response :success
  end

end
