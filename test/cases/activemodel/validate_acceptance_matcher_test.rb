require 'test_helper'

class ValidateAcceptanceTest < MiniTest::Unit::TestCase
  test 'must validate acceptance of an attribute' do
    assert_must validate_acceptance_of(:eula), Person
  end

  test 'must not validate acceptance of an attribute' do
    assert_wont validate_acceptance_of(:not_accepted), Person
  end
end
