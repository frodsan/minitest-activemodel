require 'test_helper'

class ValidationMatcherTest < MiniTest::Unit::TestCase
  def setup
    @mock = MiniTest::Mock.new
    @mock.expect :is_a?, true, [Class]
    @validator = ValidationMatcher.new :field, :type
  end

  test 'returns true if validation type exists' do
    type = MiniTest::Mock.new
    type.expect :kind, :type
    @mock.expect :validators_on, [type], [:field]

    assert @validator.matches? @mock
  end

  test 'returns false if validation type not exists' do
    @mock.expect :validators_on, [], [:field]

    assert !@validator.matches?(@mock)
  end
end
