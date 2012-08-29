require 'test_helper'

class ValidateFormatMatcherTest < MiniTest::Unit::TestCase
  test 'must validate format of an attribute' do
    assert_must validate_format_of(:email), User
  end

  test 'must not validate format of an attribute' do
    assert_wont validate_format_of(:name), User
  end
end
