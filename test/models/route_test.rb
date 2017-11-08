require 'test_helper'
require 'route.rb'

class RouteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "Test_updateRoute" do
    assert_equal addUserToRoute(1, 1),"5"
  end
end
