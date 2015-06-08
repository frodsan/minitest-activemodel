require 'test_helper'
require 'ar_test_helper'
require 'models/person'

class ValidateUniquenessMatcherTest < Minitest::Test
  test 'must validate uniqueness of an attribute' do
    assert_must validate_uniqueness_of(:email), Person
  end

  test 'must not validate uniqueness of an attribute' do
    assert_wont validate_uniqueness_of(:not_unique), Person
  end

  test 'must validate scope of an unique attribute' do
    assert_must validate_uniqueness_of(:email).scoped_to(:site), Person
  end

  test 'must not validate scope of an unique attribute' do
    assert_wont validate_uniqueness_of(:email).scoped_to(:none), Person
  end

  test 'must validate uniqueness validation does not check case' do
    assert_must validate_uniqueness_of(:email).case_insensitive, Person
  end
end
