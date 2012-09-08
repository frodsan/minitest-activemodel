require 'test_helper'

class ValidateFormatMatcherTest < MiniTest::Unit::TestCase
  test 'raises ArgumentError when no option is given' do
    assert_raises(ArgumentError) { assert_must validate_format_of(:email), User}
  end

  test 'raises if to_allow and to_not_allow are used' do
    assert_raises RuntimeError do
      assert_must validate_format_of(:email).to_allow('').to_not_allow(''), User
    end
  end

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
