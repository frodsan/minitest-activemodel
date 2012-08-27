require 'test_helper'

class ValidateLengthMatcher < MiniTest::Unit::TestCase
  test 'must validate length of an attribute' do
    assert_must validate_length_of(:name), User
  end

  test 'must not validate length of an attribute' do
    assert_wont validate_length_of(:unpresent), User
  end
end
