require "test_helper"

class FavoriteTest < ActiveSupport::TestCase

  def setup
    @horikiri = users(:horikiri)
    @jotaro = users(:jotaro)
    @letter2 = letters(:letter2)
    @fav1 = favorites(:fav1)
  end

  
  test "validである" do
    assert @fav1.valid?
  end

  test "userに属している" do
    @fav1.user_id = nil
    assert_not @fav1.valid?
  end

  test "letterに属している" do
    @fav1.letter_id = nil
    assert_not @fav1.valid?
  end



end
