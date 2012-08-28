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

  test 'must work with validates_size_of' do
    assert_must validate_length_of(:lastname), User
  end

  test 'must validate minimum length of an attribute' do
    assert_must validate_length_of(:name).with_minimum(10), User
  end

  test 'must not validate minimum length of an attribute' do
    assert_wont validate_length_of(:name).with_minimum(100), User
  end

  test 'with_minimum must be aliased to with_min' do
    assert_must validate_length_of(:name).with_min(10), User
  end

  test 'with_minimum must be aliased to is_at_least' do
    assert_must ensure_length_of(:name).is_at_least(10), User
  end
end
