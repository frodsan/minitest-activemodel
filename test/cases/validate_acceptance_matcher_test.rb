require 'test_helper'
require 'models/user'

class ValidateAcceptanceTest < Minitest::Test
  test 'must validate acceptance of an attribute' do
    assert_must validate_acceptance_of(:eula), User
  end

  test 'must not validate acceptance of an attribute' do
    assert_wont validate_acceptance_of(:not_accepted), User
  end

  test 'must validate acceptance of an attribute with an accepted value' do
    assert_must validate_acceptance_of(:terms_of_service).accept_with(true), User
  end

  test 'must not validate acceptance of an attribute with an unaccepted value' do
    assert_wont validate_acceptance_of(:terms_of_service).accept_with('1'), User
  end
end
