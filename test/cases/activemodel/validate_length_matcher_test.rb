require 'test_helper'

class ValidateLengthMatcher < MiniTest::Unit::TestCase
  test 'must validate length of an attribute' do
    assert_must validate_length_of(:name), User
  end

  test 'must not validate length of an attribute' do
    assert_wont validate_length_of(:unpresent), User
  end

  test 'must be aliased as validate_size_of' do
    assert_must validate_size_of(:name), User
  end

  test 'must be aliased as ensure_length_of' do
    assert_must ensure_length_of(:name), User
  end

  test 'must be aliased as ensure_size_of' do
    assert_must ensure_size_of(:name), User
  end
end
