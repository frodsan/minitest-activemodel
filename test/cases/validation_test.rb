require 'test_helper'

class ValidationMatcherTest < MiniTest::Unit::TestCase
  def setup
    @validator = ValidationMatcher.new :field, :type
  end

  test 'returns false if validation type not exists' do
    subject = create_subject :field, :another_type

    assert !@validator.matches?(subject)
  end

  test 'returns true if validation type exists' do
    subject = create_subject :field, :type

    assert @validator.matches? subject
  end

  test 'set failure message if validation type not exists' do
    subject = create_subject :field, :another_type

    @validator.matches? subject

    assert_match 'no type validator for field', @validator.failure_message
  end

  test 'set negative failure message if validation type exists' do
    subject = create_subject :field, :type

    @validator.matches? subject

    assert_match 'type validator for field', @validator.negative_failure_message
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
