require 'test_helper'

class ValidateAcceptanceTest < MiniTest::Unit::TestCase
  test 'must validate acceptance of an attribute' do
    assert_must validate_acceptance_of(:eula), Person
  end

  test 'must not validate acceptance of an attribute' do
    assert_wont validate_acceptance_of(:not_accepted), Person
  end

  test 'must validate acceptance of an attribute with a given accepted value' do
    assert_must validate_acceptance_of(:terms_of_service).accept_with(true), Person
  end
end
