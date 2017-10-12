require 'test_helper'

class RoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @route = routes(:one)
  end

  test "should get index" do
    get routes_url
    assert_response :success
  end

  test "should get new" do
    get new_route_url
    assert_response :success
  end

  test "should create route" do
    assert_difference('Route.count') do
      post routes_url, params: { route: { cost: @route.cost, departure: @route.departure, description: @route.description, from_lat: @route.from_lat, from_lng: @route.from_lng, title: @route.title, to_lat: @route.to_lat, to_lng: @route.to_lng, waypoints: @route.waypoints } }
    end

    assert_redirected_to route_url(Route.last)
  end

  test "should show route" do
    get route_url(@route)
    assert_response :success
  end

  test "should get edit" do
    get edit_route_url(@route)
    assert_response :success
  end

  test "should update route" do
    patch route_url(@route), params: { route: { cost: @route.cost, departure: @route.departure, description: @route.description, from_lat: @route.from_lat, from_lng: @route.from_lng, title: @route.title, to_lat: @route.to_lat, to_lng: @route.to_lng, waypoints: @route.waypoints } }
    assert_redirected_to route_url(@route)
  end

  test "should destroy route" do
    assert_difference('Route.count', -1) do
      delete route_url(@route)
    end

    assert_redirected_to routes_url
  end
  
  test "should get show_my_routes" do
    get routes_show_my_routes_url
    assert_response :success
  end

end
