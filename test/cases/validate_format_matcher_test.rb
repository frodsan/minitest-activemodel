require 'test_helper'

class ValidateFormatMatcherTest < MiniTest::Unit::TestCase
  test 'must validate valid format of an attribute' do
    assert_must validate_format_of(:email).to_allow('foo@bar.com'), User
  end

  test 'must not validate valid format of an attribute' do
    assert_wont validate_format_of(:email).to_allow('foo_bar_com'), User
  end

  test 'must validate invalid format of an attribute' do
    assert_must validate_format_of(:email).to_not_allow('foo_bar_com'), User
  end

  test 'must not validate invalid format of an attribute' do
    assert_wont validate_format_of(:email).to_not_allow('foo@bar.com'), User
  end
end
