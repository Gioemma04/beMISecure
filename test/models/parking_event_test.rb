require 'test_helper'

class ParkingEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
   test "parcheggio completo" do
    p = ParkingEvent.find(45)
    assert p.isCompleted? == true
  end
  
     test "parcheggio incompleto" do
    p = ParkingEvent.find(46)
    assert p.isCompleted? == false
  end
  

  
end
