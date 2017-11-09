require 'test_helper'
require 'route.rb'

class RouteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @route = routes(:one)
  end
  #-------------------------------------------Funciones a testear-----------------------------------------
  def addUserToRoute(route, user)
        Route.find(route).update_attribute(:users_in_route, Route.find(route).users_in_route + user.to_s + ', ')
        Route.find(route).update_attribute(:spaces_available, Route.find(route).spaces_available - 1)
  end
  
  def checkUserInRoute(route, user)
        a = Route.find(route).users_in_route
        b = a.split(", ")
        b.include? (user.to_s)
  end
  
    def removeUserToRoute(route, user)
        a = Route.find(route).users_in_route
        b = a.split(", ")
        b.delete_at(b.index(user.to_s))
        c = ""
        b.each do |u|
            c = c + u + ", "
        end
        Route.find(route).update_attribute(:users_in_route, c)
        Route.find(route).update_attribute(:spaces_available, Route.find(route).spaces_available + 1)
    end

    def countMyRoutes(user_id)
        Route.where(:id_user => user_id).count
    end
    
    def countOtherRoutes(user_id)
        Route.where.not(:id_user => user_id).count
    end
  #-----------------------------------------------------------------------------------------------------
  
  test "Test_addUserToRoute" do
    #print @route.id
    #print Route.count
    addUserToRoute(1, 1)
    
    assert_equal "1, ",Route.find(1).users_in_route
  end
  
    test "Test_checkUserInRoute" do
    #print @route.id
    #print Route.count
    addUserToRoute(2, 25)
    
    assert checkUserInRoute(2,25)
  end
  
    test "Test_removeUserToRoute" do
    #print @route.id
    #print Route.count
    
   
    addUserToRoute(2, 23)
    addUserToRoute(2, 24)
    removeUserToRoute(2, 24)
    #print Route.find(2).users_in_route
    p = Route.find(2).spaces_available
    assert_equal 3,Route.find(2).spaces_available
  end
  
    test "Test_countMyRoutes" do
    assert_equal 2,countMyRoutes(1)
  end
  
  test "Test_countOtherRoutes" do
    assert_equal 1,countOtherRoutes(1)
  end
end
