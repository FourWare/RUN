require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car = cars(:one)
  end
=begin
  test "should get index" do
    
    #print cars_url
    get cars_url
    assert_response :redirect
  end



  test "should get new" do
    #print new_car_url
    get new_car_url
    assert_response :redirect
  end
  


  test "should create car" do
    print cars_path
    print Car.count
    post cars_path(@car), params: { car: { capacidad: @car.capacidad, color: @car.color, modelo: @car.modelo, placa: @car.placa, tipo: @car.tipo } }
    get cars_path(@car), params: { car: { capacidad: @car.capacidad, color: @car.color, modelo: @car.modelo, placa: @car.placa, tipo: @car.tipo } }
    assert_response :success
  end

  test "should show car" do
    get car_url(@car)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_url(@car)
    assert_response :success
  end

  test "should update car" do
    patch car_url(@car), params: { car: { capacidad: @car.capacidad, color: @car.color, modelo: @car.modelo, placa: @car.placa, tipo: @car.tipo } }
    assert_redirected_to car_url(@car)
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end
=end

end
