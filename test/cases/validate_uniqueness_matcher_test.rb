require 'test_helper'
require 'ar_test_helper'

class ValidateUniquenessMatcherTest < MiniTest::Unit::TestCase
  test 'must validate uniqueness of an attribute' do
    assert_must validate_uniqueness_of(:email), Person
  end

  test 'must not validate uniqueness of an attribute' do
    assert_wont validate_uniqueness_of(:not_unique), Person
  end
end
