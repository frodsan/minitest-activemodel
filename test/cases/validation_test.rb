require 'test_helper'

class ValidationMatcherTest < MiniTest::Unit::TestCase
  def setup
    @validator ||= ValidationMatcher.new :field, :type
  end

  test 'returns true if validation type exists' do
    subject = create_subject :field, :type

    assert @validator.matches? subject
  end

  test 'returns false if validation type not exists' do
    subject = create_subject :field, :another_type

    assert !@validator.matches?(subject)
  end

  private

  def create_subject field, type
    arg = MiniTest::Mock.new
    arg.expect :kind, type

    subject = MiniTest::Mock.new
    subject.expect :is_a?, true, [Class]
    subject.expect :validators_on, [arg], [field]
  end
end
