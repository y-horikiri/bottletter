require "test_helper"

class LetterTest < ActiveSupport::TestCase
  
  def setup
    @horikiri = users(:horikiri)
    @letter1 = letters(:letter1)
  end

  test "validである" do
    assert @letter1.valid?
  end

  test "ユーザーに属している" do
    @letter1.user_id = nil
    assert_not @letter1.valid?
  end

  test "contentはnot null" do
    @letter1.content = nil
    assert_not @letter1.valid?
    @letter1.content = ""
    assert_not @letter1.valid?
    @letter1.content = " "
    assert_not @letter1.valid?
  end

  test "repliableはnot null" do
    @letter1.repliable = nil
    assert_not @letter1.valid?
  end
  
  test "twitter_attachedはnot null" do
    @letter1.twitter_attached = nil
    assert_not @letter1.valid?
  end
  

end
