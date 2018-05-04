require 'test_helper'

class ChainTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
    
  test "catena libera" do
    c = Chain.find(666)
    assert c.isFree? == true
  end
  
  
  
    test "catena libera1" do
    c = Chain.find(55)
    assert c.isFree? == true
  end
  
  
    test "catena occupata" do
    c = Chain.find(63)
    assert c.isFree? == false
  end


  
end
