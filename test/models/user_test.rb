require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @horikiri = users(:horikiri)
  end

  test "validである" do
    assert @horikiri.valid?
  end
  
  test "nameの存在のvalidation" do
    @horikiri.name = nil
    assert_not @horikiri.valid?
  end


end
