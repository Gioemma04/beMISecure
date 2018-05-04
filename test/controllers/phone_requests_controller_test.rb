require 'test_helper'

class PhoneRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @phone_request = phone_requests(:one)
  end

namespace :`Filename()` do
  
end
  test "new parking con catena mai usata" do
   assert_difference('ParkingEvent.count') do
     post phone_requests_url, params: { phone_request: {"user_id":11037,"chain_id":19 } }
    end
  end
  
  
  
  
end
