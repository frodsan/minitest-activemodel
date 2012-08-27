require 'test_helper'

class ValidationMatcherTest < MiniTest::Unit::TestCase
  def setup
    @validator = ValidationMatcher.new :attr, :type
  end

  test 'returns false if validation type not exists' do
    subject = create_subject :attr, :another_type

    assert !@validator.matches?(subject)
  end

  test 'returns true if validation type exists' do
    subject = create_subject :attr, :type

    assert @validator.matches? subject
  end

  test 'set failure message if validation type not exists' do
    subject = create_subject :attr, :another_type

    @validator.matches? subject

    assert_match 'no type validator for attr', @validator.failure_message
  end

  test 'set negative failure message if validation type exists' do
    subject = create_subject :attr, :type

    @validator.matches? subject

    assert_match 'type validator for attr', @validator.negative_failure_message
  end

  private

  def create_subject attr, type
    arg = MiniTest::Mock.new
    arg.expect :kind, type

    subject = MiniTest::Mock.new
    subject.expect :is_a?, true, [Class]
    subject.expect :validators_on, [arg], [attr]
  end
end
