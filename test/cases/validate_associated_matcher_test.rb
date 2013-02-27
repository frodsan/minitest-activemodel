require 'test_helper'
require 'ar_test_helper'
require 'models/person'

class ValidateAssociatedMatcherTest < MiniTest::Unit::TestCase
  test 'must validate exists association' do
    assert_must validate_associated(:posts), Person
  end

  test 'must not validate exists association' do
    assert_wont validate_associated(:parent), Person
  end
end
