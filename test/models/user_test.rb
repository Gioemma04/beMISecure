require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "utente attivo" do
    u = User.find(11037)
    assert u.isActive? == true
  end
  


  test "Utente parcheggiato" do
    u = User.find(11037)
    c = Chain.find(63)
    assert u.hasBikeParkedin?(c) == true
  end
  
  
  
end
