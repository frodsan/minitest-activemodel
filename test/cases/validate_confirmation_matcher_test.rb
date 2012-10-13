require 'test_helper'
require 'models/user'

class ValidateConfirmationMatcherTest < MiniTest::Unit::TestCase
  test 'must validate confirmation of an attribute' do
    assert_must validate_confirmation_of(:password), User
  end

  test 'must not validate confirmation of an optional attribute' do
    assert_wont validate_confirmation_of(:no_confirm), User
  end
end
