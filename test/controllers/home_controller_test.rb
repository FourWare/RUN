require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_url
    assert_response :success
  end
  
  test "should get entrar" do
    get home_entrar_url
    assert_response :success
  end
  
  test "should get registro" do
    get home_registro_url
    assert_response :success
  end
  
  test "should get recuperacion_contrasena" do
    get home_recuperacion_contrasena_url
    assert_response :success
  end

end
