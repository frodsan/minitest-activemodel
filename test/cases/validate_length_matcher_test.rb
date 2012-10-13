require 'test_helper'
require 'models/user'

class ValidateLengthMatcher < MiniTest::Unit::TestCase
  test 'raises ArgumentError when no option is given' do
    assert_raises(ArgumentError) { assert_must validate_length_of(:name), User }
  end

  test 'must validate minimum length of an attribute' do
    assert_must validate_length_of(:name).with_minimum(10), User
  end

  test 'must not validate minimum length of an attribute' do
    assert_wont validate_length_of(:name).with_minimum(100), User
  end

  test 'with_minimum must be aliased as with_min' do
    assert_must validate_length_of(:name).with_min(10), User
  end

  test 'with_minimum must be aliased as is_at_least' do
    assert_must ensure_length_of(:name).is_at_least(10), User
  end

  test 'must validate maximum length of an attribute' do
    assert_must validate_length_of(:name).with_maximum(100), User
  end

  test 'must not validate maximum length of an attribute' do
    assert_wont validate_length_of(:name).with_maximum(10), User
  end

  test 'must validate minimum and maximum length of an attribute' do
    assert_must validate_length_of(:name).within(10..100), User
  end

  test 'must not validate minimum and maximum length of an attribute' do
    assert_wont validate_length_of(:name).within(100..10), User
  end

  test 'within must be aliased as in' do
    assert_must validate_length_of(:name).in(10..100), User
  end

  test 'within must be a range' do
    assert_raises ArgumentError do
      assert_must validate_length_of(:name).within(10), User
    end
  end

  test 'must validate exact length of an attribute' do
    assert_must validate_length_of(:password).is(8), User
  end

  test 'must not validate exact length of an attribute' do
    assert_wont validate_length_of(:password).is(7), User
  end

  test 'is must be aliased as is_equal_to' do
    assert_must validate_length_of(:password).is_equal_to(8), User
  end

  test 'must be aliased as validate_size_of' do
    assert_must validate_size_of(:name).with_max(100), User
  end

  test 'must be aliased as ensure_length_of' do
    assert_must ensure_length_of(:name).with_max(100), User
  end

  test 'must be aliased as ensure_size_of' do
    assert_must ensure_size_of(:name).is_at_most(100), User
  end

  test 'must be aliased as validates_size_of' do
    assert_must validate_length_of(:lastname).with_max(100), User
  end
end
